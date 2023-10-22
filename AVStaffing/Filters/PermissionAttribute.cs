using System;
using System.Security.Claims;
using System.Security.Principal;
using System.Web.Mvc;
using System.Web.Routing;
using AVStaffing.Infrastructure;

namespace AVStaffing
{
    public class ExcludeFromPermission : Attribute
    {
    }

    public class PermissionAttribute : AuthorizeAttribute
    {
        public string PermissionDescription { get; set; }

        public PermissionAttribute()
        {

        }

        public PermissionAttribute(string description)
        {
            PermissionDescription = description;
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            try
            {
                var anonActionAttributes = filterContext.ActionDescriptor
                    .GetCustomAttributes(typeof(AllowAnonymousAttribute), true);
                var anonControllerAttributes = filterContext.ActionDescriptor.ControllerDescriptor
                    .GetCustomAttributes(typeof(AllowAnonymousAttribute), true);
                var excludeFromPermission = filterContext.ActionDescriptor
                    .GetCustomAttributes(typeof(ExcludeFromPermission), true);
                if (anonActionAttributes.Length != 0 || anonControllerAttributes.Length != 0 ||
                    excludeFromPermission.Length != 0) return;

                if (!filterContext.HttpContext.Request.IsAuthenticated)
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                    {
                        controller = "Account", action = "Login", returnUrl = filterContext.HttpContext.Request.FilePath
                    }));
                }
                else
                {
                    //Create permission string based on the requested controller name and action name in the format 'controllername-action'
                    string requiredPermission = string.Format("{0}-{1}",
                        filterContext.ActionDescriptor.ControllerDescriptor.ControllerName,
                        filterContext.ActionDescriptor.ActionName);
                    if (!filterContext.HttpContext.User.HasPermission(requiredPermission) &
                        !filterContext.HttpContext.User.IsSysAdmin())
                        //User doesn't have the required permission and is not a SysAdmin, return our custom “401 Unauthorized” access error
                        //Since we are setting filterContext.Result to contain an ActionResult page, the controller's action will not be run.
                        //The custom “401 Unauthorized” access error will be returned to the browser in response to the initial request.
                        filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                            {{"action", "UnAuthorized"}, {"controller", "Error"}});
                    //If the user has the permission to run the controller's action, the filterContext.Result will be uninitialized and
                    //executing the controller's action is dependant on whether filterContext.Result is uninitialized.
                }
            }
            catch (Exception ex)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                    {controller = "Error", action = "UnAuthorized", _errorMsg = ex.Message}));
            }
        }
    }


    public static class RbacExtendedMethods4Principal
    {
        public static int GetUserId(this IIdentity _identity)
        {
            var retVal = 0;
            if (_identity != null && _identity.IsAuthenticated)
            {
                var ci = _identity as ClaimsIdentity;
                string _userId = ci != null ? ci.FindFirstValue(ClaimTypes.NameIdentifier) : null;

                if (!string.IsNullOrEmpty(_userId)) retVal = int.Parse(_userId);
            }

            return retVal;
        }

        public static bool HasPermission(this IPrincipal principal, string requiredPermission)
        {
            var retVal = false;
            if (principal?.Identity == null || !principal.Identity.IsAuthenticated) return false;
            string userId = principal.Identity is ClaimsIdentity ci
                ? ci.FindFirstValue(ClaimTypes.NameIdentifier)
                : null;

            if (string.IsNullOrEmpty(userId)) return false;
            var authenticatedUser = ApplicationUserManager.GetUser(int.Parse(userId));
            retVal = authenticatedUser.IsPermissionInUserRoles(requiredPermission) || authenticatedUser.IsSysAdmin();

            return retVal;
        }

        public static bool IsSysAdmin(this IPrincipal _principal)
        {
            var _retVal = false;
            if (_principal != null && _principal.Identity != null && _principal.Identity.IsAuthenticated)
            {
                var ci = _principal.Identity as ClaimsIdentity;
                string _userId = ci != null ? ci.FindFirstValue(ClaimTypes.NameIdentifier) : null;

                if (string.IsNullOrEmpty(_userId)) return _retVal;
                var _authenticatedUser = ApplicationUserManager.GetUser(int.Parse(_userId));
                _retVal = _authenticatedUser.IsSysAdmin();
            }

            return _retVal;
        }

        public static string FindFirstValue(this ClaimsIdentity identity, string claimType)
        {
            var _retVal = string.Empty;
            if (identity != null)
            {
                var claim = identity.FindFirst(claimType);
                _retVal = claim != null ? claim.Value : null;
            }

            return _retVal;
        }
    }
}