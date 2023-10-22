using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;
using AVStaffing.Models.ViewModels;
using Microsoft.AspNet.Identity;

namespace AVStaffing.Controllers
{
    public class UserController : BaseController
    {
        #region USERS
        [HttpGet]
        [Permission("Users => User List")]
        public ActionResult Users()
        {
            return View(ApplicationUserManager.GetUsers());
        }

        [HttpGet]
        [Permission("Users => Add/Edit User")]
        public ActionResult AddUser(int id = 0)
        {
            if (id != 0)
            {
                ApplicationUser user = ApplicationUserManager.GetUser(id);
                SetViewBagData(id);
                UserViewModel userVm = MapToUserObject(user);
                return View(userVm);
            }
            return View(new UserViewModel
            {
                SelectedRoles = new List<int>(),
                Roles = DbContext.Roles.ToList()
            });
        }

   

        [HttpPost]
        [Permission("Users => Add/Edit User")]
        public ActionResult AddUser(UserViewModel userVm)
        {
            int userId = 0;
            SetupModel(userVm);
            if (!UserValidations(userVm))
            {
                Notify("Error", "Validation Error", "Please see the validations", isRedirectMessage: true);
                return View(userVm);
            }
            if (userVm.Id == 0)
            {
                ApplicationUser applicationUser = MapToApplicationUser(userVm);
                var result = UserManager.Create(applicationUser, userVm.Password);
                if (result.Succeeded)
                {
                    foreach (var role in userVm.SelectedRoles)
                    {
                        ApplicationUserManager.AddUser2Role(applicationUser.Id, role);
                    }
                    userId = applicationUser.Id;
                    Notify("Success", "Successfully Added", "User Added Successfully", isRedirectMessage: true);
                }
                else
                {
                    foreach (var err in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, err);
                        return View("AddUser", userVm);
                    }
                }
            }
            else
            {
                ApplicationUserManager.UpdateUser(userVm);
                var user = DbContext.Users.Include(x => x.Roles).FirstOrDefault(x => x.Id == userVm.Id);
                if (user.Roles != null && user.Roles.Count > 0)
                {
                    foreach (var role in user.Roles)
                    {
                        ApplicationUserManager.RemoveUser4Role(user.Id, role.RoleId);
                    }
                }
                foreach (var role in userVm.SelectedRoles)
                {
                    ApplicationUserManager.AddUser2Role(user.Id, role);
                }
                userId = user.Id;
                Notify("Success", "Successfully Updated", "User Updated Successfully", isRedirectMessage: true);
            }
            return RedirectToAction("AddUser", "User", new { id = userId });
        }


        [HttpPost]
        [Permission("Users => Enable/Disable User")]
        public ActionResult ToggleUserActivation(int userId, bool status)
        {
            var user = DbContext.Users.FirstOrDefault(x => x.Id == userId);
            if (user != null)
            {
                var u = ApplicationUserManager.GetUser(userId);
                user.Inactive = status;
                DbContext.SaveChanges();
                UserManager.SetLockoutEnabled(u.Id, status);
                Notify("Success", "Successfully Changed", "User Lockout status updated successfully", isAjaxMessage: true);
            }
            else
            {
                Notify("Error", "Technical Error", "No user found", isAjaxMessage: true);
            }
            return Json("Ok");

        }


        [HttpGet]
        [ExcludeFromPermission]
        public ActionResult UserProfile()
        {
            var id = User.Identity.GetUserId();
            ApplicationUser user = ApplicationUserManager.GetUser(id);
            SetViewBagData(id);
            var userVm = new UserViewModel
            {
                Email = user.Email,
                Firstname = user.FirstName,
                UserName = user.UserName,
                Lastname = user.LastName,
                Id = user.Id,
                ImagePath = user.ImagePath,
                Language = user.SupportedLanguage
            };
            return View("AddUser", userVm);
        }

        [HttpPost]
        [ExcludeFromPermission]
        [Authorize(Roles = Roles.SuperAdmin + "," + Roles.Admin + "," + Roles.User + "," + Roles.Patient + "," + Roles.Physician)]
        public ActionResult UserProfile(UserViewModel userVm)
        {
            userVm.Id = User.Identity.GetUserId();
            SetupModel(userVm);
            if (!UserValidations(userVm))
            {
                Notify("Error", "Validation Error", "Please see the validations", isRedirectMessage: true);
                return View("AddUser", userVm);
            }
            ApplicationUserManager.UpdateUser(userVm);
            Notify("Success", "Successfully Updated", "User Updated Successfully", isRedirectMessage: true);
            return RedirectToAction("UserProfile", "User");
        }

       

        [HttpPost]
        [Permission("Users => Delete User")]
        public JsonResult DeleteUser(int userId)
        {
            try
            {
                var user = DbContext.Users.FirstOrDefault(x => x.Id == userId);
                DbContext.Users.Remove(user);
                DbContext.SaveChanges();
                Notify("Success", "Successfully Deleted", "User Deleted Successfully", isAjaxMessage: true);
                return Json("Ok");
            }
            catch (Exception ex)
            {
                Notify("Error", "Technical Error", "Unable to delete user", isAjaxMessage: true);
                throw;
            }
        }

        private bool UserValidations(UserViewModel userVm)
        {
            var context = new ValidationContext(userVm);
            List<ValidationResult> validationResults = new List<ValidationResult>();
            bool isValid = Validator.TryValidateObject(userVm, context, validationResults, true);
            if (userVm.SelectedRoles == null || userVm.SelectedRoles.Count == 0)
            {
                ModelState.AddModelError(string.Empty, "Please select at least one role");
            }
            if (!isValid)
            {
                foreach (var key in ModelState.Keys)
                {
                    if (ModelState[key].Errors != null)
                    {
                        foreach (var err in ModelState[key].Errors)
                        {
                            ModelState.AddModelError(key, errorMessage: err.ErrorMessage);
                            break;
                        }
                    }
                }

            }
            return isValid;
        }
        private void SetupModel(UserViewModel userVm)
        {
            if (userVm.Id != 0)
            {
                userVm.Password = "Zawar123!@#";
                userVm.ConfirmPassword = "Zawar123!@#";
            }
            userVm.Roles = DbContext.Roles.ToList();
            if (userVm.ImageFile != null)
            {
                var url = UploadFile(userVm.ImageFile, "~/Public/UserProfiles/");
                userVm.ImagePath = url;
            }

            if (!string.IsNullOrWhiteSpace(userVm.SignatureFile))
            {
                var url = UploadFile(userVm.UserName + "_signature", userVm.SignatureFile, "/Public/UserSignatures/");
                userVm.SignaturePath = url;
            }
        }

        protected override void Dispose(bool disposing)
        {
            DbContext.Dispose();
            base.Dispose(disposing);
        }

        private void SetViewBagData(int _userId)
        {
            SetViewBagData(_userId.ToString());
        }

        private void SetViewBagData(string _userId)
        {
            ViewBag.UserId = _userId;
            ViewBag.List_boolNullYesNo = this.List_boolNullYesNo();
            ViewBag.RoleId = new SelectList(ApplicationRoleManager.GetRoles4SelectList(), "Id", "Name");
        }

        public List<SelectListItem> List_boolNullYesNo()
        {
            return new List<SelectListItem>
            {
                new SelectListItem { Text = "Not Set", Value = null },
                new SelectListItem { Text = "Yes", Value = bool.TrueString },
                new SelectListItem { Text = "No", Value = bool.FalseString }
            };
        }

        private UserViewModel MapToUserObject(ApplicationUser user)
        {
            return new UserViewModel
            {
                Email = user.Email,
                Firstname = user.FirstName,
                UserName = user.UserName,
                Lastname = user.LastName,
                Initials = user.Initials,
                Id = user.Id,
                ImagePath = user.ImagePath,
                Language = user.SupportedLanguage,
                SignaturePath = user.Signature,
                DateOfBirth = user.DateOfBirth,
                PhoneNumber = user.PhoneNumber,
                Gender = user.Gender,
                SelectedRoles = user.Roles.Select(x => x.RoleId).ToList(),
                Roles = DbContext.Roles.ToList()
            };
        }
        private static ApplicationUser MapToApplicationUser(UserViewModel userVm)
        {
            return new ApplicationUser
            {
                LastName = userVm.Lastname,
                Id = 0,
                Email = userVm.Email,
                UserName = userVm.UserName,
                EmailConfirmed = true,
                Initials = userVm.Initials,
                FirstName = userVm.Firstname,
                JoinDate = DateTime.Now,
                LastModified = DateTime.Now,
                ImagePath = userVm.ImagePath,
                Signature = userVm.SignaturePath,
                SupportedLanguage = userVm.Language,
                LoginTime = DateTime.Now,
                DateOfBirth = userVm.DateOfBirth,
                Gender = userVm.Gender,
                PhoneNumber = userVm.PhoneNumber
            };
        }

        #endregion
    }
}