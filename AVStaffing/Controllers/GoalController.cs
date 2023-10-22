using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{
    public class GoalController : BaseController
    {

        [HttpGet]
        public ActionResult GoalList()
        {
            var goalList = DbContext.Goals.ToList();
            return View(goalList);
        }

        [HttpGet]
        public ActionResult AddGoal(int goalId = 0)
        {
            var goal = new Goal();
            if (goalId != 0)
            {
                goal = DbContext.Goals.FirstOrDefault(x => x.Id == goalId);
            }
            return View(goal);
        }

        [HttpPost]
        public ActionResult AddGoal(Goal goal)
        {
            DbContext.Goals.AddOrUpdate(goal);
            DbContext.SaveChanges();
            return RedirectToAction(nameof(AddGoal));
        }

        [HttpPost]
        public ActionResult DeleteGoal(int goalId)
        {
            try
            {
                var goal = DbContext.Goals.First(x => x.Id == goalId);
                DbContext.Goals.Remove(goal);
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