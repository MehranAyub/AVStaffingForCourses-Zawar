using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
    public class CourseController : BaseController
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [Permission("Course => Add/Edit Course")]
        public ActionResult AddCourse(int Id = 0)
        {
            var Course = new Course();
            if (Id != 0)
            {
                Course = DbContext.Course.FirstOrDefault(x => x.Id == Id);
            }
            ViewBag.Courses = DbContext.Pages.Where(x => x.PageId == null).ToList();
            return View(Course);
        }

        [HttpPost]
        [Permission("Course => Add/Edit Course")]
        public ActionResult AddCourse(Course Course, HttpPostedFileBase videoFile)
        {
            int id = Course.Id;
            if (ModelState.IsValid)
            {
                DbContext.Course.AddOrUpdate(Course);
                DbContext.SaveChanges();
            }
            else
            {
                var context = new ValidationContext(Course);
                List<ValidationResult> validationResults = new List<ValidationResult>();
                bool isValid = Validator.TryValidateObject(Course, context, validationResults, true);
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
                    return View(Course);
                }
            }

            if (id == 0)
            {
                Notify("Success", "Successfully Added", "Course Added Successfully", isRedirectMessage: true);
            }
            else
            {
                Notify("Success", "Successfully Updated", "Course Updated Successfully", isRedirectMessage: true);

            }
            return RedirectToAction("AddCourse", "Course");
        }



        [HttpPost]
        public ActionResult DeleteCourse(int CourseId)
        {
            try
            {
                var Course = DbContext.Course.First(x => x.Id == CourseId);
                DbContext.Course.Remove(Course);
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