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
    public class CourseContentController : BaseController
    {
        [HttpGet]
        public ActionResult Index(int id)
        {
            if (id > 0)
            {
                var Course = DbContext.Course.Where(x => x.Id == id).FirstOrDefault();
                if (Course != null)
                {
                    ViewBag.CourseId = Course.Id;
                    ViewBag.Name = Course.Name;
                    return View();
                }
                return RedirectToAction("Index", "Course");
            }
            else { return RedirectToAction("Index", "Course"); }
        }
        [HttpGet]
        [Permission("CourseContent => Add/Edit CourseContent")]
        public ActionResult AddCourseContent(int courseId,int Id=0)
        {
            var CourseContent = new CourseContent();
            CourseContent.CourseId= courseId;
            if (Id != 0)
            {
                CourseContent = DbContext.CourseContent.FirstOrDefault(x => x.Id == Id);
            }
            //ViewBag.Courses = DbContext.Pages.Where(x => x.PageId == null).ToList();
            return View(CourseContent);
        }

        [HttpPost]
        [Permission("CourseContent => Add/Edit CourseContent")]
        public ActionResult AddCourseContent(CourseContent CourseContent, HttpPostedFileBase videoFile)
        {
            int id = CourseContent.Id;
            if (ModelState.IsValid)
            {
                if (videoFile != null)
                {
                    var fileName = Path.GetFileName(videoFile.FileName);
                    var path = Path.Combine(Server.MapPath("~/www"), fileName);
                    videoFile.SaveAs(path);
                    CourseContent.VideoUrl = "/www/" + fileName;
                }
                DbContext.CourseContent.AddOrUpdate(CourseContent);
                DbContext.SaveChanges();
            }
            else
            {
                var context = new ValidationContext(CourseContent);
                List<ValidationResult> validationResults = new List<ValidationResult>();
                bool isValid = Validator.TryValidateObject(CourseContent, context, validationResults, true);
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

                    Notify("Error", "Validation Error", "Please see the validations", isRedirectMessage: true);
                    ViewBag.Courses = DbContext.Pages.ToList();
                    return View(CourseContent);
                }
            }

            if (id == 0)
            {
                Notify("Success", "Successfully Added", "Course Content Added Successfully", isRedirectMessage: true);
            }
            else
            {
                Notify("Success", "Successfully Updated", "Course Content Updated Successfully", isRedirectMessage: true);

            }
            return RedirectToAction("Index", "CourseContent" ,new { id = CourseContent.CourseId });
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