using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Hubs;
using AVStaffing.Models;
using AVStaffing.Models.Entities;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;

namespace AVStaffing.Controllers
{
    public class NotificationController : BaseController
    {
        [HttpGet]
        [ExcludeFromPermission]
        public HttpResponseMessage SendNotification(NotifModels obj)
        {
            var objNotifyHub = new NotificationHub();
            var objNotify = new Notification {UserId = obj.UserID, Code = "temp", IsRead = false, IsDeleted = false, IsReminder = false, DateCreated =  DateTime.Now, Title = "", Type = "Notification"};
            DbContext.Configuration.ProxyCreationEnabled = false;
            DbContext.Notifications.Add(objNotify);
            DbContext.SaveChanges();
            objNotifyHub.SendNotification(objNotify.UserId);
            return new HttpResponseMessage();
        }


        [HttpPost]
        [ExcludeFromPermission]
        public JsonResult GetNotifications()
        {
            var notifications = DbContext.Notifications
                .Where(x => x.UserId == SessionUser.Id && !x.IsDeleted)
                .OrderByDescending(x=>x.DateCreated)
                .ToList();

            notifications.ForEach(x => x.IsRead = true);
            DbContext.SaveChanges();
            return Json(notifications);
        }


        [HttpGet]
        [ExcludeFromPermission]
        public JsonResult Notification()
        {
            var hubObj = new NotificationHub();
            Notify("Success", "this is a test notification", "this is a test", true);
            //Notify("Error", "this is a test notification", "this is a test", true);
            return Json("Ok", JsonRequestBehavior.AllowGet);
        }
    }

}