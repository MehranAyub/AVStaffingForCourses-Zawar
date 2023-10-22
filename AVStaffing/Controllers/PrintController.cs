using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{

    public class MedicalRecordPrintModel
    {
        public List<MedicineEntry> MedicinceEntries { get; set; }
        public MedicalRecord MedicalRecord { get; set; }
    }

    public class MedicineEntry
    {
        public Medication Medicine { get; set; }
        public List<MedicineCell> AdministeredMedicineRecord { get; set; }
    }

    public class MedicineCell 
    {
        public DateTime AdministeredDate { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime StopTime { get; set; }
        public string StaffInitials { get; set; }
    
    }


    public class  TreatmentPlanPrintModel
    {
        public TreatmentPlan TreatmentPlan { get; set; }
    }

    public class PrintController : BaseController
    {
        [HttpGet]
        public ActionResult BlankISP()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ClinicalSummary(int id)
        {
            var clinicalSummary = DbContext.ClinicalSummaries
                .Include(x => x.Patient)
                .Include(x => x.Staff)
                .Include(x => x.Medicines.Select(y => y.Medication))
                .FirstOrDefault(x => x.Id == id);

            return View(clinicalSummary);
        }

        [HttpGet]
        public ActionResult ClinicalSummarytwo()
        {
            return View();
        }

        [HttpGet]
        public ActionResult COFSDischargeSummary()
        {
            return View();
        }

        [HttpGet]
        public ActionResult COFSINCISP()
        {
            return View();
        }

        [HttpGet]
        public ActionResult COFSInternationalIncidentForm()
        {
            return View();
        }

        [HttpGet]
        public ActionResult DischargeSummary()
        {
            return View();
        }

        [HttpGet]
        public ActionResult MarCofSinc(int id)
        {
            var dbMar = DbContext.Mar
                .Include(x => x.AdministeredMedications).Include(x => x.AdministeredMedications.Select(y=>y.Medication)).Include(x=>x.AdministeredMedications.Select(y=>y.Staff))
                .Include(x => x.NotAdministeredMedicines).Include(x => x.NotAdministeredMedicines.Select(y=>y.Medication))
                .Include(x => x.Patient)
                .Include(x => x.Doctor)
                .Include(x => x.Staff).Include(x => x.Staff.Select(y => y.Staff)).FirstOrDefault(x=>x.Id == id);

            var vm = new MedicalRecordPrintModel();
            var lst = new List<MedicineEntry>();


            foreach (var medicine in dbMar.AdministeredMedications) 
            {
                var m = lst.FirstOrDefault(x => x.Medicine.Id == medicine.MedicationId);
                var medCell = new MedicineCell
                {
                    AdministeredDate = medicine.StartTime,
                    StartTime = medicine.StartTime,
                    StopTime = medicine.EndTime,
                    StaffInitials = medicine.Staff.Initials
                };

                if (m == null)
                {
                    lst.Add(new MedicineEntry { AdministeredMedicineRecord = new List<MedicineCell> { medCell }, Medicine = medicine.Medication });
                }
                else 
                {
                    m.AdministeredMedicineRecord.Add(medCell);
                }
            }
            vm.MedicinceEntries = lst;
            vm.MedicalRecord = dbMar;
            return View(vm);
        }
        public ActionResult NightLog(int id)
        {
            var dbPlan = DbContext.NightLogs
                .Include(x => x.NightLogTimes.Select(y => y.Staff))
                .Include(x => x.Patient).FirstOrDefault(x => x.Id == id);
            return View(dbPlan);
        }


        [HttpGet]
        public ActionResult TreatmentPlan(int id)
        {
            var dbPlan = DbContext.TreatmentPlans
                .Include(x=>x.Patient)
                .Include(x=>x.Goals)
                .Include(x=>x.Staff)
                .FirstOrDefault(x => x.Id == id);
            var plan = new TreatmentPlanPrintModel
            {
                TreatmentPlan = dbPlan
            };
            return View(plan);
        }
        public ActionResult ContinuedStayForm()
        {
            return View();
        }
        public ActionResult BehaviorPlan()
        {
            return View();
        }
        public ActionResult BehaviorModification()
        {
            return View();
        }
        public ActionResult RiskAssessment()
        {
            return View();
        }
    }
}