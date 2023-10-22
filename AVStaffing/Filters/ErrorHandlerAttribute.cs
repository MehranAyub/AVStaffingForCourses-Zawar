using System.Data.SqlClient;
using System.Text;
using System.Web.Mvc;
using AVStaffing.Controllers;
using AVStaffing.Models;
using AVStaffing.Models.Entities;

namespace AVStaffing.Filters
{
    public class ErrorHandlerAttribute : FilterAttribute, IExceptionFilter
    {
        public void OnException(ExceptionContext filterContext)
        {
            filterContext.ExceptionHandled = true;
            var controller = (BaseController)filterContext.Controller;
            var isAjaxRequest = filterContext.RequestContext.HttpContext.Request.IsAjaxRequest();
            var errorMessages = new StringBuilder();

            //if (filterContext.Exception is HttpAntiForgeryException)
            //{
            //    if (filterContext.HttpContext.Request.Url != null)
            //        filterContext.Result = new RedirectResult(filterContext.HttpContext.Request.Url.AbsoluteUri);
            //}
            //else  
            if (filterContext.Exception is SqlException)
            {
                var ex = (SqlException)filterContext.Exception;
                for (var i = 0; i < ex.Errors.Count; i++)
                {
                    string message = $@"
 Message: { ex.Errors[i].Message} Error Number: {ex.Errors[i].Number} LineNumber: {ex.Errors[i].LineNumber} Source: {ex.Errors[i].Source}
";

                    errorMessages.Append(message);
                }
                ShowSqlExceptionMessage(ex.Number, controller, isAjaxRequest);
                controller.ErrorLog(errorMessages.ToString());
                controller.ErrorLog(ex.StackTrace);
            }
            else
            {
                var exception = filterContext.Exception;
                if (filterContext.Exception is HttpAntiForgeryException)
                {
                    ShowForgeryExceptionMessage("your session has expired", controller, isAjaxRequest);
                }
                else
                {
                    ShowOtherExceptionMessage(exception.Message, controller, isAjaxRequest);
                }
                controller.ErrorLog("Technical Error: " + filterContext.Exception.Message + "Page :" + filterContext.HttpContext.Request.Url + ", Previous Page :" + filterContext.HttpContext.Request.UrlReferrer);
                controller.ErrorLog(exception.ToString());
            }

            if (!isAjaxRequest)
            {
                if (filterContext.HttpContext.Request.Url != null && !filterContext.HttpContext.Request.Url.AbsoluteUri.Contains("err=1"))
                {
                    if (filterContext.HttpContext.Request.RequestType == "POST")
                    {

                        filterContext.Result = new RedirectResult(filterContext.HttpContext.Request.Url.AbsoluteUri + "?err=1");
                    }
                    else
                    {
                        filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary { { "action", "Index" }, { "controller", "Error" } });
                    }

                }
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary { { "action", "AjaxRedirect" }, { "controller", "Error" } });
            }
        }

        internal void ShowOtherExceptionMessage(string message, BaseController controller, bool isAjaxRequest)
        {


            controller.Notify(new NotificationMessage
            {
                Code = "500",
                Message =
#if DEBUG
                    $"Internal Server Error: 500. <br/> {message} <br/> Please contact the Administrator."
#else

                    $"Internal Server Error: 500. Please contact the Administrator."
#endif
                ,
                Title = "Technical Error",
                Type = "Error",
                IsViewMessage = false,
                IsAjaxMessage = isAjaxRequest,
                IsRedirectMessage = !isAjaxRequest
            });
        }

        internal void ShowForgeryExceptionMessage(string message, BaseController controller, bool isAjaxRequest)
        {
            controller.Notify(new NotificationMessage
            {
                Code = "401",
                Message = $"Unauthorized. <br/> {message} <br/> Please refresh the page or try re logging in.",
                Title = "Invalid Credentials",
                Type = "Warn",
                IsViewMessage = false,
                IsAjaxMessage = isAjaxRequest,
                IsRedirectMessage = !isAjaxRequest
            });
        }

        internal void ShowSqlExceptionMessage(int code, BaseController controller, bool isAjaxRequest)
        {
            controller.Notify(new NotificationMessage
            {
                Code = code.ToString(),
                Message = $"Internal Server Error: {code}. <br/> Please contact the Administrator.",
                Title = "Technical Error",
                Type = "Error",
                IsViewMessage = false,
                IsAjaxMessage = isAjaxRequest,
                IsRedirectMessage = !isAjaxRequest
            });
        }
    }
}