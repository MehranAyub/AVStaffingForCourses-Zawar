using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{
    public class UserCourseController : BaseController
    {
        [HttpGet]
        public ActionResult Index()
        {
            
            return View();
        }
        [HttpGet]
        public ActionResult ShowCourseContent(int courseId)
        {
            ViewBag.courseId = courseId;
            return View();
        }
        [HttpPost]
        public ActionResult UpdateWatchTime(int videoId, double videoTime, double watchedTime)
        {
            try
            {
                var userId= User.Identity.GetUserId();
                var userVideoProgress = DbContext.UserVideoProgress
                    .FirstOrDefault(uvp => uvp.UserId == userId && uvp.VideoId == videoId);
                watchedTime = watchedTime / 60;
                if (userVideoProgress == null)
                {
                    // If the record doesn't exist, create a new one
                    userVideoProgress = new UserVideoProgress
                    {
                        UserId = userId,
                        VideoId = videoId,
                        WatchedTime = watchedTime,
                        CompletionStatus = watchedTime >= videoTime ? true : false
                    };
                    DbContext.UserVideoProgress.Add(userVideoProgress);
                    DbContext.SaveChanges();

                }
                else
                {
                    if (userVideoProgress.CompletionStatus == false)
                    {
                        userVideoProgress.WatchedTime = watchedTime;
                        userVideoProgress.CompletionStatus = userVideoProgress.CompletionStatus == true ? true : watchedTime >= videoTime ? true : false;
                        DbContext.SaveChanges();

                    }
                }


                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult VerifyWatchTimeStatus(int videoId)
        {
            try
            {
                var userId = User.Identity.GetUserId();
                var userVideoProgress = DbContext.UserVideoProgress
                    .FirstOrDefault(uvp => uvp.UserId == userId && uvp.VideoId == videoId);
                if (userVideoProgress != null)
                {
                    return Json(new { success = userVideoProgress.CompletionStatus });
                }
                return Json(new { success = false });
            }
            catch
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult DeleteCourseContent(int ContentId)
        {
            try
            {
                var Content = DbContext.CourseContent.First(x => x.Id == ContentId);
                DbContext.CourseContent.Remove(Content);
                DbContext.SaveChanges();
                return Json(true);
            }
            catch (Exception ex)
            {
                return Json(false);
            }

        }

    }
}