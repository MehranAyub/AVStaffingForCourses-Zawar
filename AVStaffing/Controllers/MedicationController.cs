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
    public class MedicationController : BaseController
    {

        [HttpGet]
        [Permission("Medications => MedicationList")]
        public ActionResult MedicationList()
        {
            var medications = DbContext.Medications.ToList();
            return View(medications);
        }

        [HttpGet]
        [Permission("Medications => Add/Edit Medication")]
        public ActionResult AddMedication(int medicationId = 0)
        {
            var medication = new Medication();
            if (medicationId != 0)
            {
                medication = DbContext.Medications.FirstOrDefault(x => x.Id == medicationId);
            }
            return View(medication);
        }

        [HttpPost]
        [Permission("Medications => Add/Edit Medication")]
        public ActionResult AddMedication(Medication medication)
        {
            DbContext.Medications.AddOrUpdate(medication);
            DbContext.SaveChanges();
            return RedirectToAction(nameof(AddMedication));
        }


        [HttpPost]
        [Permission("Medications => Delete Medication")]
        public ActionResult DeleteMedication(int medicationId)
        {
            try
            {
                var medication = DbContext.Medications.First(x => x.Id == medicationId);
                DbContext.Medications.Remove(medication);
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