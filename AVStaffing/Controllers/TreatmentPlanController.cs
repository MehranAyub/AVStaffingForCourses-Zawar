using System;
using System.Collections.Generic;
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

    public class TreatmentPlan_VM
    {
        public List<ApplicationUser> Patients { get; set; }
        public TreatmentPlan TreatmentPlan { get; set; }
        public List<Goal> GoalList { get; set; }
        public List<int> GoalIds { get; set; }
        public List<ApplicationUser> Staff { get; set; }

        public TreatmentPlan_VM()
        {
            Patients = new List<ApplicationUser>();
            TreatmentPlan  = new TreatmentPlan();
            GoalIds = new List<int>();
            GoalList = new List<Goal>();
        }
    }

    public class TreatmentPlanController : BaseController
    {

        [HttpGet]
        public ActionResult TreatmentPlanList()
        {
            var treatmentPlanList = DbContext.TreatmentPlans.Include(x=>x.Patient).Include(x=>x.Goals).ToList();
            return View(treatmentPlanList);
        }

        [HttpGet]
        public ActionResult AddTreatmentPlan(int id = 0)
        {
            var vm = new TreatmentPlan_VM {TreatmentPlan = new TreatmentPlan()};
            if (id != 0)
            {
                vm.TreatmentPlan = DbContext.TreatmentPlans.Include(x=>x.Goals).FirstOrDefault(x => x.Id == id);
            }

            if ( vm.TreatmentPlan?.Goals != null) vm.GoalIds = vm.TreatmentPlan.Goals.Select(x => x.Id).ToList();
            vm.GoalList = DbContext.Goals.ToList();
            vm.Patients = DbContext.Users.Where(x=>x.Roles.Any(y=> y.Role.Name == Roles.Patient)).ToList();
            vm.Staff = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Staff)).ToList();
            return View(vm);
        }

        [HttpPost]
        public ActionResult AddTreatmentPlan(TreatmentPlan_VM vm)
        {
            var staffId = Request.Form["TreatmentPlan.StaffId"];
            if (vm.GoalIds != null)
            {
                vm.TreatmentPlan.Goals = DbContext.Goals.Where(x => vm.GoalIds.Contains(x.Id)).ToList();
            }

            DbContext.TreatmentPlans.AddOrUpdate(vm.TreatmentPlan);
            DbContext.SaveChanges();
            return RedirectToAction(nameof(AddTreatmentPlan));
        }

        [HttpPost]
        public ActionResult DeleteTreatmentPlan(int treatmentPlanId)
        {
            try
            {
                var treatmentPlan = DbContext.TreatmentPlans.First(x => x.Id == treatmentPlanId);
                DbContext.TreatmentPlans.Remove(treatmentPlan);
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