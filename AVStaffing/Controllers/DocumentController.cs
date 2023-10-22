using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using System.Data.Entity;
using System;
using System.Data.Entity.Migrations;
using System.Globalization;

namespace AVStaffing.Controllers
{

    public class MedicalRecord_VM
    {
        public MedicalRecord MedicalRecord { get; set; }
        public List<ApplicationUser> Patients { get; set; }
        public List<ApplicationUser> Physicians { get; set; }
        public List<ApplicationUser> Staff { get; set; }
        public List<Medication> Medications { get; set; }
        public List<MedicalRecordStaff> MedicalRecordStaff { get; set; }

        public MedicalRecord_VM()
        {
            MedicalRecord = new MedicalRecord();
            Patients = new List<ApplicationUser>();
            Physicians = new List<ApplicationUser>();
            Medications = new List<Medication>();
            MedicalRecordStaff = new List<MedicalRecordStaff>();
        }
    }

    public class DocumentController : BaseController
    {

        [HttpGet]
        public ActionResult DocumentList()
        {
            var documentList = DbContext.Mar.Include(x => x.Patient).Include(x => x.Doctor).ToList();
            return View(documentList);
        }

        [HttpGet]
        public ActionResult AddDocument(int id = 0)
        {
            var vm = new MedicalRecord_VM();
            if (id != 0)
            {
                vm.MedicalRecord = DbContext.Mar
                    .Include(x => x.Staff)
                    .Include(x => x.AdministeredMedications)
                    .Include(x => x.NotAdministeredMedicines)
                    .Include(x => x.NotAdministeredMedicines.Select(y => y.Staff))
                    .Include(x => x.NotAdministeredMedicines.Select(y => y.Medication))
                    .FirstOrDefault(x => x.Id == id);
                vm.MedicalRecordStaff = vm.MedicalRecord.Staff.ToList();
            }
            else
            {
                var staff = DbContext.Users.FirstOrDefault(x => x.Roles.Any(y => y.Role.Name == Roles.Staff));
                var nMedicines = DbContext.Medications.Take(2).ToList().Select(x => new NotAdministeredMedicine
                {
                    Date = DateTime.UtcNow,
                    Id = 0,
                    Initials = "",
                    MarId = 0,
                    MedicalRecord = null,
                    Medication = x,
                    MedicationId = x.Id,
                    Reason = "Reason",
                    Result = "Result",
                    Staff = staff,
                    StaffId = staff.Id
                }).ToList();

                vm.MedicalRecord = new MedicalRecord
                {
                    AdmissionDate = DateTime.UtcNow,
                    Allergies = "Allergies",
                    Comments = "Comments",
                    Diagnosis = "Diagnosis",
                    Doctor = DbContext.Users.FirstOrDefault(x => x.Roles.Any(y => y.Role.Name == Roles.Physician)),
                    AdministeredMedications = null,
                    DoctorId = 0,
                    FacilityName = "",
                    Id = 0,
                    NotAdministeredMedicines = nMedicines,
                    Patient = DbContext.Users.FirstOrDefault(x => x.Roles.Any(y => y.Role.Name == Roles.Patient)),
                    PatientId = 0,
                    Record = "Record",
                    Staff = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Staff)).Take(2).ToList().Select(x => new MedicalRecordStaff { MedicalRecordId = 0, StaffId = x.Id }).ToList(),
                    StartStopDate = DateTime.UtcNow
                };
                vm.MedicalRecord.PatientId = vm.MedicalRecord.Patient.Id;
                vm.MedicalRecord.DoctorId = vm.MedicalRecord.Doctor.Id;
            }

            vm.Medications = DbContext.Medications.ToList();
            vm.Physicians = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Physician)).ToList();
            vm.Patients = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Patient)).ToList();
            vm.Staff = DbContext.Users.Where(x => x.Roles.Any(y => y.Role.Name == Roles.Staff)).ToList();
            return View(vm);
        }

        [HttpPost]
        public JsonResult AddDocument(MedicalRecord medicalRecord)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    medicalRecord.AdministeredMedications.ForEach(x =>
                    {
                        if (x.StartTime == new DateTime())
                        {
                            x.StartTime = DateTime.UtcNow;
                        }
                        if (x.EndTime == new DateTime())
                        {
                            x.EndTime = DateTime.UtcNow;
                        }
                    });

                    medicalRecord.NotAdministeredMedicines?.ForEach(x => x.Staff = null);
                    medicalRecord.NotAdministeredMedicines?.ForEach(x => x.Medication = null);

                    if (medicalRecord.Id != 0)
                    {
                        var marStaff = DbContext.MedicalRecordStaff.Where(x => x.MedicalRecordId == medicalRecord.Id).ToList();
                        DbContext.MedicalRecordStaff.RemoveRange(marStaff);
                        var nMedicines = DbContext.NotAdministeredMedicines.Where(x => x.MarId == medicalRecord.Id).ToList();
                        DbContext.NotAdministeredMedicines.RemoveRange(nMedicines);
                        var aMedicines = DbContext.AdministeredMedicines.Where(x => x.MarId == medicalRecord.Id).ToList();
                        DbContext.AdministeredMedicines.RemoveRange(aMedicines);


                        DbContext.SaveChanges();
                        if (medicalRecord.Staff != null)
                        {
                            medicalRecord.Staff.ForEach(x => x.MedicalRecordId = medicalRecord.Id);
                            DbContext.MedicalRecordStaff.AddRange(medicalRecord.Staff);
                        }
                        if (medicalRecord.NotAdministeredMedicines != null)
                        {
                            medicalRecord.NotAdministeredMedicines.ForEach(x => x.MarId = medicalRecord.Id);
                            DbContext.NotAdministeredMedicines.AddRange(medicalRecord.NotAdministeredMedicines);
                        }
                        if (medicalRecord.AdministeredMedications != null)
                        {
                            medicalRecord.AdministeredMedications.ForEach(x => x.MarId = medicalRecord.Id);
                            DbContext.AdministeredMedicines.AddRange(medicalRecord.AdministeredMedications);
                        }
                        DbContext.Mar.AddOrUpdate(medicalRecord);
                        DbContext.SaveChanges();
                    }
                    else
                    {
                        DbContext.Mar.Add(medicalRecord);
                        DbContext.SaveChanges();
                    }
                    return Json(true);
                }
                return Json(false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}