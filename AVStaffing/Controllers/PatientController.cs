using System;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using System.Data.Entity;
namespace AVStaffing.Controllers
{
    public class PatientController : BaseController
    {

        [HttpGet]
        [Permission("Patients => PatientList")]
        public ActionResult PatientList()
        {
            var patients = DbContext.Users.Include(x=>x.Roles)
                .Include(x=>x.Roles.Select(z=>z.Role))
                .Where(x=>x.Roles.Any(y=>y.Role.Name == Roles.Patient)).ToList();
            return View(patients);
        }

        //[HttpGet]
        //[Permission("Patients => Add/Edit Patient")]
        //public ActionResult AddPatient(int patientId = 0)
        //{
        //    var patient = new Patient();
        //    if (patientId != 0)
        //    {
        //        patient = DbContext.Patients.FirstOrDefault(x => x.Id == patientId);
        //    }
        //    return View(patient);
        //}

        //[HttpPost]
        //[Permission("Patients => Add/Edit Patient")]
        //public async Task<ActionResult> AddPatient(Patient patient)
        //{
        //    var role = await GetPatientRole();
        //    await UserManager.CreateAsync(patient.User);
        //    await UserManager.AddToRoleAsync(patient.User.Id, role.Name);
        //    DbContext.Patients.AddOrUpdate(patient);
        //    DbContext.SaveChanges();
        //    return RedirectToAction(nameof(AddPatient));
        //}

        private async Task<ApplicationRole> GetPatientRole()
        {
            var role = await RoleManager.FindByNameAsync(Roles.Patient);
            if (role == null)
            {
                var role1 = new ApplicationRole
                {
                    IsSysAdmin = false,
                    LastModified = DateTime.UtcNow,
                    Name = Roles.Patient,
                    Permissions = null,
                    RoleDescription = null
                };
                await RoleManager.CreateAsync(role1);
                role = await RoleManager.FindByNameAsync(Roles.Patient);
            }
            return role;
        }

        [HttpPost]
        [Permission("Patients => Delete Patient")]
        public ActionResult DeletePatient(int patientId)
        {
            try
            {
                var patient = DbContext.Users.First(x => x.Id == patientId);
                DbContext.Users.Remove(patient);
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