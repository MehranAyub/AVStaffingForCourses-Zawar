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

    public class NightLog_VM
    {
        public List<ApplicationUser> Patients { get; set; }
        public NightLog NightLog { get; set; }
        public List<NightLogTime> NightLogTimes { get; set; }
        public List<ApplicationUser> Staff { get; set; }

        public NightLog_VM()
        {
            Patients = new List<ApplicationUser>();
            NightLog  = new NightLog();
            NightLogTimes = new List<NightLogTime>();
        }
    }


    public class NightLogController : BaseController
    {

        [HttpGet]
        public ActionResult NightLogList()
        {
            var NightLogList = DbContext.NightLogs.Include(x => x.Patient).Include(x => x.NightLogTimes).ToList();
            return View(NightLogList);
        }

        [HttpGet]
        public ActionResult AddNightLog(int id = 0)
        {
            var vm = new NightLog_VM { NightLog = new NightLog() };
            if (id != 0)
            {
                vm.NightLog = DbContext.NightLogs.Include(x => x.NightLogTimes).FirstOrDefault(x => x.Id == id);
                if (vm.NightLog == null)
                {
                    vm.NightLog = new NightLog();
                }
            }

            CreateNightLogRows(vm.NightLog);
            vm.Patients = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Patient)).ToList();
            vm.Staff = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Staff)).ToList();
            return View(vm);
        }

        public double[] timeOfday = new double[]
        {
            8,  8.5, 
            9,  9.5,
            10, 10.5, 
            11, 11.5, 
            12, 12.5,
            13, 13.5,
            14, 14.5,
            15, 15.5,
            16, 16.5,
            17, 17.5,
            18, 18.5,
            19, 19.5,
            20, 20.5,
            21, 21.5,
            22, 22.5,
            23, 23.5,
            0,  0.5,
            1,  1.5,
            2,  2.5,
            3,  3.5,
            4,  4.5,
            5,  5.5,
            6,  6.5,
            7,  7.5
        };

        public void CreateNightLogRows(NightLog nightLog)
        {
            if (nightLog.NightLogTimes == null)  nightLog.NightLogTimes = new List<NightLogTime>();
            foreach (var time in timeOfday)
            {
                if (nightLog.NightLogTimes.All(x => x.TimeStamp.TimeOfDay != TimeSpan.FromHours(time)))
                {
                    nightLog.NightLogTimes.Add(new NightLogTime
                    {
                        TimeStamp = DateTime.Now.Date.AddHours(time),
                        Comments = "",
                        SleepStatus = ""
                    });
                }
            }
        }

        [HttpPost]
        public ActionResult AddNightLog(NightLog_VM vm)
        {
            DbContext.NightLogs.AddOrUpdate(vm.NightLog);
            DbContext.SaveChanges();
            return RedirectToAction(nameof(AddNightLog));
        }

        [HttpPost]
        public ActionResult DeleteNightLog(int NightLogId)
        {
            try
            {
                var NightLog = DbContext.NightLogs.First(x => x.Id == NightLogId);
                DbContext.NightLogs.Remove(NightLog);
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