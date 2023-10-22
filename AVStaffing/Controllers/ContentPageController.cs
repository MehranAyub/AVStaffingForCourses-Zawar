using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{

    public class ContentPageController : BaseController
    {
        [HttpGet]
        [Permission("ContentPage => ContentPage List")]
        public ActionResult ContentPages()
        {
            var ContentPageList = DbContext.Pages.ToList();
            return View(ContentPageList.ToList());
        }


        [HttpGet]
        [Permission("ContentPage => Add/Edit ContentPage")]
        public ActionResult AddContentPage(int Id = 0)
        {
            var ContentPage = new ContentPage();
            if (Id != 0)
            {
                ContentPage = DbContext.Pages.FirstOrDefault(x => x.Id == Id);
            }
            ViewBag.ContentPages = DbContext.Pages.Where(x=>x.PageId == null).ToList();
            return View(ContentPage);
        }

        [HttpPost]
        [Permission("ContentPage => Add/Edit ContentPage")]
        public ActionResult AddContentPage(ContentPage ContentPage)
        {
            int id = ContentPage.Id;
            if (ModelState.IsValid)
            {
                DbContext.Pages.AddOrUpdate(ContentPage);
                DbContext.SaveChanges();
            }
            else
            {
                var context = new ValidationContext(ContentPage);
                List<ValidationResult> validationResults = new List<ValidationResult>();
                bool isValid = Validator.TryValidateObject(ContentPage, context, validationResults, true);
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
                    ViewBag.ContentPages = DbContext.Pages.ToList();
                    return View(ContentPage);
                }
            }

            if (id == 0)
            {
                Notify("Success", "Successfully Added", "ContentPage Added Successfully", isRedirectMessage: true);
            }
            else
            {
                Notify("Success", "Successfully Updated", "ContentPage Updated Successfully", isRedirectMessage: true);

            }
            return RedirectToAction("AddContentPage", "ContentPage");
        }


        [HttpPost]
        [Permission("ContentPage => Delete ContentPage")]
        public ActionResult DeleteContentPage(int ContentPageId)
        {
            var ContentPage = DbContext.Pages.FirstOrDefault(x => x.Id == ContentPageId);
            if (ContentPage != null)
            {
                DbContext.Pages.Remove(ContentPage);
                DbContext.SaveChanges();
            }
            Notify("Success", "Successfully Deleted", "ContentPage Deleted Successfully", isAjaxMessage: true);
            return Json(true);
        }
    }

}