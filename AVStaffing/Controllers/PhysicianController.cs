using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{
    public class PhysicianController : BaseController
    {

        [HttpGet]
        public ActionResult PhysicianList()
        {
            var physicianList = DbContext.Users.Where(x=>x.Roles.Any(y=>y.Role.Name == Roles.Physician)).ToList();
            return View(physicianList);
        }

     

    }
}