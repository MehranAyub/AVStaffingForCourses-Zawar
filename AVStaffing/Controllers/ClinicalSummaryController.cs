using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using AVStaffing.Models.ViewModels;

namespace AVStaffing.Controllers
{

    public class ClinicalSummary_VM
    {
        public List<ApplicationUser> Patients { get; set; }
        public ClinicalSummary ClinicalSummary { get; set; }
        public List<ApplicationUser> Staff { get; set; }
        public List<Medication> Medicines { get; set; }

        public ClinicalSummary_VM()
        {
            Patients = new List<ApplicationUser>();
            ClinicalSummary  = new ClinicalSummary();
            Medicines = new List<Medication>();

        }
    }


  

    public class ClinicalSummaryController : BaseController
    {

        [HttpGet]
        public ActionResult ClinicalSummaryList()
        {
            var ClinicalSummaryList = DbContext.ClinicalSummaries.Include(x=>x.Patient).Include(x=>x.Staff).ToList();
            return View(ClinicalSummaryList);
        }

        [HttpGet]
        public ActionResult AddClinicalSummary(int id = 0)
        {
            var vm = new ClinicalSummary_VM {ClinicalSummary = new ClinicalSummary()};
            if (id != 0)
            {
                vm.ClinicalSummary = DbContext.ClinicalSummaries
                    .Include(x=>x.Medicines.Select(y=>y.Medication))
                    .Include(x=>x.Patient).Include(x=>x.Staff)
                    .FirstOrDefault(x => x.Id == id);
                if (vm.ClinicalSummary == null)
                {
                    vm.ClinicalSummary = new ClinicalSummary();
                }
            }

            vm.Medicines = DbContext.Medications.ToList();
            if (vm.ClinicalSummary.Medicines == null)
            {
                vm.ClinicalSummary.Medicines = new List<ClinicalSummaryMedication>();
            }

            vm.Patients = DbContext.Users.Where(x=>x.Roles.Any(y=> y.Role.Name == Roles.Patient)).ToList();
            vm.Staff = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Staff)).ToList();
            return View(vm);
        }

        [HttpPost]
        public ActionResult AddClinicalSummary(ClinicalSummary_VM vm)
        {
            bool add = vm.ClinicalSummary.Id == 0;
            vm.ClinicalSummary.Medicines = vm.ClinicalSummary.Medicines?.Where(x => x.MedicationId != 0).ToList();
            DbContext.ClinicalSummaries.AddOrUpdate(vm.ClinicalSummary);
            DbContext.SaveChanges();
            if (!add)
            {
                var medicines = DbContext.ClinicalSummaryMedications.Where(x => x.ClinicalSummaryId == vm.ClinicalSummary.Id).ToList();
                DbContext.ClinicalSummaryMedications.RemoveRange(medicines);
                DbContext.SaveChanges();
                if (vm.ClinicalSummary.Medicines != null && vm.ClinicalSummary.Medicines.Count > 0)
                {
                    foreach (var item in vm.ClinicalSummary.Medicines)
                    {
                        item.ClinicalSummaryId = vm.ClinicalSummary.Id;
                    }
                    DbContext.ClinicalSummaryMedications.AddRange(vm.ClinicalSummary.Medicines);
                }
                DbContext.SaveChanges();
            }

          
            return RedirectToAction(nameof(AddClinicalSummary));
        }

        [HttpPost]
        public ActionResult DeleteClinicalSummary(int ClinicalSummaryId)
        {
            try
            {
                var ClinicalSummary = DbContext.ClinicalSummaries.First(x => x.Id == ClinicalSummaryId);
                DbContext.ClinicalSummaries.Remove(ClinicalSummary);
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