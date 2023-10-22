using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{
    public class ContactController : BaseController
    {

        [HttpGet]
        [Permission("Contacts => ContactList")]
        public ActionResult ContactList()
        {
            var Contacts = DbContext.ContactForms.ToList();
            return View(Contacts);
        }

        [HttpGet]
        [Permission("Contacts => Add/Edit Contact")]
        public ActionResult AddContact(int id = 0)
        {
            var Contact = new ContactForm();
            if (id != 0)
            {
                Contact = DbContext.ContactForms.FirstOrDefault(x => x.Id == id);
            }
            return View(Contact);
        }

        [HttpPost]
        [Permission("Contacts => Add/Edit Contact")]
        public ActionResult AddContact(ContactForm Contact)
        {
            DbContext.ContactForms.AddOrUpdate(Contact);
            DbContext.SaveChanges();
            return RedirectToAction(nameof(AddContact));
        }


        [HttpPost]
        [Permission("Contacts => Delete Contact")]
        public ActionResult DeleteContact(int ContactId)
        {
            try
            {
                var Contact = DbContext.ContactForms.First(x => x.Id == ContactId);
                DbContext.ContactForms.Remove(Contact);
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