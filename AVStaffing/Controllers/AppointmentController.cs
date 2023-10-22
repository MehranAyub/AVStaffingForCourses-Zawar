using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Entities;
using System.Data.Entity;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace AVStaffing.Controllers
{

    public class Appointment_VM
    {
        public Appointment Appointment { get; set; } = new Appointment();
        public List<ApplicationUser> Users { get; set; } = new List<ApplicationUser>();
        public List<int> SelectedUsers { get; set; } = new List<int>();  
    }

    public class AppointmentController : BaseController
    {

        [HttpGet]
        [Permission("Appointments => AppointmentList")]
        public ActionResult AppointmentList()
        {
            var Appointments = DbContext.Appointments.Include(x=>x.Members).ToList();
            return View(Appointments);
        }

        [HttpGet]
        [Permission("Appointments => Add/Edit Appointment")]
        public async Task<ActionResult> AddAppointment(int id = 0)
        {
            var vm = new Appointment_VM();
            if (id != 0)
            {
                vm.Appointment = DbContext.Appointments.Include(x=>x.Members).FirstOrDefault(x => x.Id == id);
                vm.SelectedUsers = vm.Appointment.Members.Select(x => x.Id).ToList();
            }
       
            vm.Users = DbContext.Users.ToList();
            return View(vm);
        }

        [HttpPost]
        [Permission("Appointments => Add/Edit Appointment")]
        public async Task<ActionResult> AddAppointment(Appointment_VM vm)
        {
            var baseUrl = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, Url.Content("~"));
            var users = DbContext.Users.Where(x => vm.SelectedUsers.Contains(x.Id)).ToList();
            vm.Appointment.Members = users;
            DbContext.Appointments.AddOrUpdate(vm.Appointment);
            DbContext.SaveChanges();
            EmailService emailService = new EmailService();
            foreach (var user in users)
            {

                var url = baseUrl + "/VideoChat/Index?q=" + Aes256CbcEncrypter.Encrypt(JsonConvert.SerializeObject(new { Id = user.Id, roomName = vm.Appointment.Id }));
                try
                {
                    await emailService.SendAsync(
                        new Microsoft.AspNet.Identity.IdentityMessage
                        {
                            Body = $@"you have been added to an Appointment. Please <a href=""{url}"">Click here</a> to join",
                            Destination = user.Email,
                            Subject = "Appointment Scheduled"

                        });
                }
                catch (Exception ex) 
                {
                    Notify("Error", "Email Sending failure", "Appointment created but unable to send an email", false, false, true);
                }
            }
            return RedirectToAction(nameof(AddAppointment));
        }


        [HttpPost]
        [Permission("Appointments => Delete Appointment")]
        public ActionResult DeleteAppointment(int AppointmentId)
        {
            try
            {
                var Appointment = DbContext.Appointments.First(x => x.Id == AppointmentId);
                DbContext.Appointments.Remove(Appointment);
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