using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Filters;
using AVStaffing.Hubs;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.SignalR;
using Microsoft.Owin.Security;

namespace AVStaffing.Controllers
{
    //[ErrorHandler]
    [Permission]
    public class BaseController : Controller
    {
        protected readonly IHubContext<NotificationHub> HubContext;
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        private readonly ApplicationRoleManager _applicationRoleManager;
        protected ApplicationDbContext DbContext = new ApplicationDbContext();
        protected ApplicationUser SessionUser => User != null ? UserManager.FindById(User.Identity.GetUserId()) : null;
        protected readonly log4net.ILog Logger;

        protected List<Notification> Notifications =>
            User != null && User.Identity.IsAuthenticated && SessionUser != null
                ? DbContext.Notifications.Where(x => x.UserId == SessionUser.Id).ToList()
                : new List<Notification>();


        public BaseController()
        {
            this.Logger = log4net.LogManager.GetLogger("BaseController");
        }

        public BaseController(ApplicationUserManager userManager, ApplicationSignInManager signInManager, ApplicationRoleManager applicationRoleManager, IHubContext<NotificationHub> hubContext)
        {
            UserManager = userManager;
            SignInManager = signInManager;
            _applicationRoleManager = applicationRoleManager;
            this.HubContext = hubContext;
            this.Logger = log4net.LogManager.GetLogger("BaseController");
        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            int culture;

            if (Session["CurrentCulture"] == null)
            {
                int.TryParse(System.Configuration.ConfigurationManager.AppSettings["Culture"], out culture);
                Session["CurrentCulture"] = culture;
                
            }
            else
            {
                culture = (int)Session["CurrentCulture"];
            }

            if (culture == 0)
            {
                Session["CultureContent"] = SupportedLanguages.English;
            }
            else
            {
                Session["CultureContent"] =SupportedLanguages.English;
            }
            CultureHelper.CurrentCulture = culture;
            Session["Pages"] = DbContext.Pages.ToList();

        }

        public ApplicationSignInManager SignInManager
        {
            get => _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            private set => _signInManager = value;
        }

        public ApplicationUserManager UserManager
        {
            get => _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            private set => _userManager = value;
        }


        public ApplicationRoleManager RoleManager => _applicationRoleManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationRoleManager>();

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }

                if (_signInManager != null)
                {
                    _signInManager.Dispose();
                    _signInManager = null;
                }

                if (DbContext != null)
                {
                    DbContext.Dispose();
                    DbContext = null;
                }
            }

            base.Dispose(disposing);
        }

        #region Helpers
        protected IAuthenticationManager AuthenticationManager => HttpContext.GetOwinContext().Authentication;

        protected void AddErrors(IdentityResult result)
        {
            foreach (string error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        protected ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

        public void Notify(
            string type, 
            string title, 
            string description, 
            bool isAjaxMessage = false, 
            bool isViewMessage = false, 
            bool isRedirectMessage = true)
        {
            Notify(new NotificationMessage
            {
                Type = type,
                Title = title,
                Message = description,
                IsAjaxMessage = isAjaxMessage,
                IsViewMessage = isViewMessage,
                IsRedirectMessage = isRedirectMessage
            });
        }
        
        public void Notify(NotificationMessage message)
        {
            message.UserId = User.Identity.GetUserId<int>();
            if (message.IsAjaxMessage)
            {
                NotificationHub hubObj = new NotificationHub();
                hubObj.Notify(message);
            }
            else if (message.IsRedirectMessage)
            {
                TempData["NotificationMessage"] = message;
            }
            else if (message.IsViewMessage)
            {
                ViewBag.NotificationMessage = message;
            }
        }
        #endregion


        [NonAction]
        public virtual void ErrorLog(string text)
        {
            Logger.Error(Request.UserHostAddress + " " + text);

        }

        [NonAction]
        public void DebugLog(string text)
        {
            Logger.Debug(Request.UserHostAddress + " " + text);
        }

        [NonAction]
        public void InfoLog(string text)
        {
            Logger.Info(Request.UserHostAddress + " " + text);
        }

        [NonAction]
        public void WarningLog(string text)
        {
            Logger.Warn(Request.UserHostAddress + " " + text);
        }


        [NonAction]
        public string UploadFile(HttpPostedFileBase file, string saveLocationFolder = "~/Public/Content/")
        {
            string fn = Path.GetFileName(file.FileName);
            string fileName = Guid.NewGuid() + Path.GetExtension(fn);
            string saveLocation = Path.Combine(saveLocationFolder, fileName);
            string absoluteFilePath = Server.MapPath(saveLocationFolder);
            if (!Directory.Exists(absoluteFilePath))
            {
                Directory.CreateDirectory(absoluteFilePath);
            }
            file.SaveAs(Path.Combine(absoluteFilePath, fileName));
            return saveLocation;
        }
        [NonAction]
        public string UploadFile(string fileName,  string base64File, string saveLocationFolder = "~/Public/Content/")
        {
            var regex = new Regex(@"^[\w/\:.-]+;base64,");
            base64File = regex.Replace(base64File, string.Empty);
            var ext = GetFileExtension(base64File);
            byte[] imageBytes = Convert.FromBase64String(base64File);
            var filepath = Path.Combine(saveLocationFolder, Path.GetFileName(fileName) + $".{ext}");
            string absoluteFilePath = Server.MapPath(filepath);
            var absoluteFolderPath = Server.MapPath(saveLocationFolder);
            if (!Directory.Exists(absoluteFolderPath))
            {
                Directory.CreateDirectory(absoluteFolderPath);
            }
            System.IO.File.WriteAllBytes(absoluteFilePath, imageBytes);
            return filepath;
        }

        public static string GetFileExtension(string base64String)
        {
            var data = base64String.Substring(0, 5);

            switch (data.ToUpper())
            {
                case "IVBOR":
                    return "png";
                case "/9J/4":
                    return "jpg";
                case "AAAAF":
                    return "mp4";
                case "JVBER":
                    return "pdf";
                case "AAABA":
                    return "ico";
                case "UMFYI":
                    return "rar";
                case "E1XYD":
                    return "rtf";
                case "U1PKC":
                    return "txt";
                case "MQOWM":
                case "77U/M":
                    return "srt";
                default:
                    return string.Empty;
            }
        }
    }
}