using AVStaffing.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AVStaffing.Controllers
{
    public class DashboardController : BaseController
    {

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult DeleteContact(int contactId)
        {
            var dbContext = new ApplicationDbContext();
            var id = dbContext.ContactForms.FirstOrDefault(x => x.Id == contactId);
            dbContext.ContactForms.Remove(id);
            dbContext.SaveChanges();
            return Json("Ok");
        }

    }
}