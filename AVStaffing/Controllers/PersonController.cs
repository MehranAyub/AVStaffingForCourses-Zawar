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
    public class PersonController : BaseController
    {

        [HttpGet]
        [Permission("Persons => PersonList")]
        public ActionResult PersonList()
        {
            var Persons = DbContext.Person.ToList();
            return View(Persons);
        }

        [HttpGet]
        [Permission("Persons => Add/Edit Person")]
        public ActionResult AddPerson(int id = 0)
        {
            var Person = new Person();
            if (id != 0)
            {
                Person = DbContext.Person.FirstOrDefault(x => x.Id == id);
            }
            return View(Person);
        }

        [HttpPost]
        [Permission("Persons => Add/Edit Person")]
        public ActionResult AddPerson(Person Person)
        {
            DbContext.Person.AddOrUpdate(Person);
            DbContext.SaveChanges();
            return RedirectToAction(nameof(AddPerson));
        }


        [HttpPost]
        [Permission("Persons => Delete Person")]
        public ActionResult DeletePerson(int PersonId)
        {
            try
            {
                var Person = DbContext.Person.First(x => x.Id == PersonId);
                DbContext.Person.Remove(Person);
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