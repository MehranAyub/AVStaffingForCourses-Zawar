using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using AVStaffing.Hubs;
using AVStaffing.Infrastructure;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using AVStaffing.Models;
using Microsoft.AspNet.SignalR;
using System.Data.Entity;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using AVStaffing.Models.Enums;
using AVStaffing.Models.ViewModels;

namespace AVStaffing.Controllers
{
    public class AccountController : BaseController
    {
        public AccountController()  {  }
        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager, ApplicationRoleManager roleManager, IHubContext<NotificationHub> hubContext) 
            : base ( userManager, signInManager, roleManager, hubContext )  { }

        #region  Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            if (SessionUser != null)
            {
                return RedirectToRoute("Dashboard");
            }

            ViewBag.ReturnUrl = returnUrl;
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Index", "Home", model);
            }

            var u = DbContext.Users.FirstOrDefault(x => x.Email == model.Email);
            if (u == null)
            {
                ModelState.AddModelError("", "Invalid email or password");
                return  RedirectToAction("Index", "Home", model);
            }
            if (u.Inactive)
            {
                ModelState.AddModelError("", "Account blocked. Please contact the administrator");
                return RedirectToAction("Index", "Home", model);
            }
            var result = await SignInManager.PasswordSignInAsync(u.UserName, model.Password, model.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    var user = UserManager.FindByEmail(model.Email);
                    if (!string.IsNullOrWhiteSpace(returnUrl) && returnUrl != "/")
                        return RedirectToLocal(returnUrl);
                    else
                        return RedirectToAction("Index", "Dashboard");
                case SignInStatus.LockedOut:
                    return View("Lockout");
                //case SignInStatus.RequiresVerification:
                //    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, model.RememberMe });
                default:
                    ModelState.AddModelError("", "Invalid login attempt.");
                    return RedirectToAction("Index", "Home", model); ;
            }
        }


        #region ForgotPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await UserManager.FindByEmailAsync(model.Email);
                if (user == null || !(await UserManager.IsEmailConfirmedAsync(user.Id)))
                {
                    // Don't reveal that the user does not exist or is not confirmed
                    return RedirectToAction("ForgotPasswordConfirmation", "Account");
                }

                string code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
                if (Request.Url != null)
                {
                    var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);

                    var emailTemplate = DbContext.EmailTemplates.Include(x => x.Variables).First(x => x.EmailTemplateType == (int)EmailTemplateEnum.ResetPassword);
                    string body = emailTemplate.Body.Replace("CallbackUrl", callbackUrl);
                    await UserManager.SendEmailAsync(user.Id, emailTemplate.Subject, body);

                    //await UserManager.SendEmailAsync(user.Id, "Reset Password", "Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>");
                }

                return RedirectToAction("ForgotPasswordConfirmation", "Account");
            }
            return View("Login", new LoginViewModel{ Email = model.Email});
        }

        [AllowAnonymous]
        public ActionResult ForgotPasswordConfirmation()
        {
            ViewBag.ForgotPasswordConfirmation = true;
            return View("Login");
        }

        #endregion


        #endregion

        #region  Register
        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                this.Logger.Debug("model is valid");
                var role = RoleManager.Roles.First(x => x.Name == nameof(Roles.User));
                this.Logger.Debug("role was picked : " + role.Name);
                var user = new ApplicationUser
                {
                    UserName = model.Email,
                    Email = model.Email,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    LastModified = DateTime.Now,
                    Inactive = false,
                    Level = 1,
                    JoinDate = DateTime.Now
                };
                this.Logger.Debug("User object created");

                var result = await UserManager.CreateAsync(user, model.Password);
                this.Logger.Debug("result value : " + result.Succeeded);
                if (result.Succeeded)
                {

                    this.Logger.Debug("creation succeeded");
                    await UserManager.AddToRoleAsync(user.Id, role.Name);
                    this.Logger.Debug("Role added");

                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    this.Logger.Debug("Logged in");

                    string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                    var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);

                    var emailTemplate = DbContext.EmailTemplates.Include(x=>x.Variables).First(x => x.EmailTemplateType == (int)EmailTemplateEnum.ConfirmEmail);
                    string body = emailTemplate.Body.Replace("CallbackUrl", callbackUrl);
                    await UserManager.SendEmailAsync(user.Id, emailTemplate.Subject, body);

                    //await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");
                    this.Logger.Debug("Email Sent");


                    this.Logger.Debug("userGroup added");
                    return RedirectToAction("Index", "Lead");
                }
                this.Logger.Debug(string.Join(",", result.Errors));
                foreach (string error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error);
                }
            }
            return View(model);
        }


        #endregion

        [AllowAnonymous]
        public async Task<ActionResult> ConfirmEmail(int userId, string code)
        {
            if (code == null)
            {
                return View("Error");
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            return View(result.Succeeded ? "ConfirmEmail" : "Error");
        }

        


        #region Reset Password
        [AllowAnonymous]
        public ActionResult ResetPassword(string userId, string code)
        {
            return code == null ? View("Error") : View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await UserManager.FindByIdAsync(model.UserId);
            if (user == null)
            {
                // Don't reveal that the user does not exist
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            AddErrors(result);
            return View();
        }

        [AllowAnonymous]
        public ActionResult ResetPasswordConfirmation()
        {
            return View();
        }


        #endregion

        [HttpGet]
        [ExcludeFromPermission]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }


        [HttpGet]
        [ExcludeFromPermission]
        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [ExcludeFromPermission]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {

                Notify("Error", "Validation Errors", "Please fix all these validation issues", isRedirectMessage:true);
                return View(model);
            }
            var result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync( User.Identity.GetUserId() );
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }

                Notify("Success", "Successfully Updated", "Password Updated Successfully", isRedirectMessage:true);
                return RedirectToAction("ChangePassword", "Account", new { Message = "Password Changed Successfully" });
            }
            AddErrors(result);
            return View(model);
        }


        [HttpGet]
        [AllowAnonymous]
        public JsonResult IsAlreadySigned(string email)
        {
            return Json(IsUserAvailable(email), JsonRequestBehavior.AllowGet);
        }
        public bool IsUserAvailable(string email)
        {
            var regEmailId = DbContext.Users.FirstOrDefault(x => x.Email == email);
            return regEmailId == null;
        }


    }
}