using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using AVStaffing.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using AVStaffing.Controllers;
using AVStaffing.Models.Constants;
using Newtonsoft.Json;
using AVStaffing.Infrastructure;

namespace AVStaffing.Models.Entities
{
    public class ApplicationRoleStore : RoleStore<ApplicationRole, int, ApplicationUserRole>
    {
        public ApplicationRoleStore(ApplicationDbContext context)
            : base(context)
        {
        }
    }

    public class ApplicationDatabaseInitializer : CreateDatabaseIfNotExists<ApplicationDbContext>
    {
        private readonly string c_SysAdmin = "System Administrator";
        private readonly string c_DefaultUser = "Default User";

        protected override void Seed(ApplicationDbContext context)
        {

            PortfolioEnglish(context);
            //Create Default Roles...
            IList<ApplicationRole> defaultRoles = new List<ApplicationRole>();
            defaultRoles.Add(new ApplicationRole
            {
                Name = c_SysAdmin,
                RoleDescription = "Allows system administration of Users/Roles/Permissions",
                LastModified = DateTime.Now,
                IsSysAdmin = true
            });
            defaultRoles.Add(new ApplicationRole
            {
                Name = c_DefaultUser,
                RoleDescription = "Default role with limited permissions",
                LastModified = DateTime.Now,
                IsSysAdmin = false
            });

            //ApplicationRoleManager RoleManager = new ApplicationRoleManager(new ApplicationRoleStore(context));
            foreach (ApplicationRole role in defaultRoles)
            {
                ApplicationRoleManager.CreateRole(role);
            }

            //Create User...
            var user = new ApplicationUser
            {
                UserName = "Admin",
                Email = "admin@somedomain.com",
                FirstName = "System",
                LastName = "Administrator",
                LastModified = DateTime.Now,
                Inactive = false,
                EmailConfirmed = true
            };

            ApplicationUserManager UserManager =
                new ApplicationUserManager(new ApplicationUserStore(context), new EmailService());
            var result = UserManager.Create(user, "Pa55w0rd");

            if (result.Succeeded)
            {
                //Add User to Admin Role...
                UserManager.AddToRole(user.Id, c_SysAdmin);
            }


            //Create Default User...
            user = new ApplicationUser
            {
                UserName = "DefaultUser",
                Email = "defaultuser@somedomain.com",
                FirstName = "Default",
                LastName = "User",
                LastModified = DateTime.Now,
                Inactive = false,
                EmailConfirmed = true
            };
            result = UserManager.Create(user, "S4l3su53r");

            if (result.Succeeded)
            {
                //Add User to Admin Role...
                UserManager.AddToRole(user.Id, c_DefaultUser);
            }

            //Create User with NO Roles...
            user = new ApplicationUser
            {
                UserName = "Guest",
                Email = "guest@somedomain.com",
                FirstName = "Guest",
                LastName = "User",
                LastModified = DateTime.Now,
                Inactive = false,
                EmailConfirmed = true
            };
            result = UserManager.Create(user, "Gu3st12");


            base.Seed(context);

            //Create a permission...
            var _permission = new Permission();
            _permission.Description = "Home-Reports";
            ApplicationRoleManager.AddPermission(_permission);

            //Add Permission to DefaultUser Role...
            ApplicationRoleManager.AddPermission2Role(context.Roles.Where(p => p.Name == c_DefaultUser).First().Id,
                context.Permissions.First().Id);
        }

        private static void PortfolioEnglish(ApplicationDbContext context)
        {
            var enGbPortfolio = context.Portfolios.FirstOrDefault(x => x.Language == SupportedLanguages.English);
            if (enGbPortfolio != null) return;

            var enGb = new Portfolio
            {
                Language = SupportedLanguages.English,
                About =
                    "Lead Monitor allows you to monitor websites for specific keywords and instantly notifies if anything changes on the website. you can define your user groups and get alerts on your email or inside panel.",
                HomeTitle = "Focus on recruitment",
                HomeSubTitle = "Monitor sites for keywords. find a job on your favorite sites",
                Services = @"",
                TestimonialTitle = "What our users say about us",
                TestimonialSubtitle = "We enable people, small and big companies to automate website checks.",
                PackagesTitle = "Scales with your business"
            };

            context.Portfolios.Add(enGb);
            context.SaveChanges();
        }

    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser, ApplicationRole, int, ApplicationUserLogin, ApplicationUserRole, ApplicationUserClaim>
    {
        public ApplicationDbContext() : base("DefaultConnection")
        {
#if !DEBUG
            Database.SetInitializer<ApplicationDbContext>(null);
#endif

            Configuration.ProxyCreationEnabled = false;
            Configuration.LazyLoadingEnabled = false;
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

    

        public DbSet<Person> Person { get; set; }
    
        public DbSet<Appointment> Appointments { get; set; }

        public DbSet<Permission> Permissions { get; set; }
        public DbSet<Log> SystemLogs { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<EmailTemplate> EmailTemplates { get; set; }
        public DbSet<TemplateVariable> TemplateVariables { get; set; }
        public DbSet<Media> Medias { get; set; }
        public DbSet<ContentPage> Pages { get; set; }
        public DbSet<Portfolio> Portfolios { get; set; }
        public DbSet<AboutUs> AboutUs { get; set; }
        public DbSet<ContactUs> ContactUs { get; set; }
        public DbSet<Testimonial> Testimonials { get; set; }
        public DbSet<TermsOfService> TermsOfService { get; set; }
        public DbSet<ClinicalSummary> ClinicalSummaries { get; set; }
        public DbSet<ClinicalSummaryMedication> ClinicalSummaryMedications { get; set; }
        public DbSet<MedicalRecord> Mar { get; set; }

        public DbSet<NotAdministeredMedicine> NotAdministeredMedicines { get; set; }

        public DbSet<Medication> Medications { get; set; }

        public DbSet<TreatmentPlan> TreatmentPlans { get; set; }


        public DbSet<Goal> Goals { get; set; }

        public DbSet<PrivateChat> PrivateChats { get; set; }
        public DbSet<GroupChat> GroupChats { get; set; }
        public DbSet<Group> Groups { get; set; }
        public DbSet<NightLog> NightLogs { get; set; }
        public DbSet<NightLogTime> NightLogTimes { get; set; }

        public DbSet<ContactForm> ContactForms { get; set; }

        public DbSet<AdministeredMedicine> AdministeredMedicines { get; set; }
        public DbSet<MedicalRecordStaff> MedicalRecordStaff { get; set; }


    }
    public class ClinicalSummary
    {
        [Key]
        public int Id { get; set; }
        public int PatientId { get; set; }
        [ForeignKey(nameof(PatientId))]
        public ApplicationUser Patient { get; set; }
        public string CC { get; set; }
        public string HPI { get; set; }
        public string PMH { get; set; }
        public string PSH { get; set; }
        public string OBPregHx { get; set; }
        [AllowHtml]
        public string SocialHistory { get; set; }
        [AllowHtml]
        public string FamilyMedicalHistory { get; set; }
        [AllowHtml]
        public string JobHistory { get; set; }
        public List<ClinicalSummaryMedication> Medicines { get; set; }
        public string Allergies { get; set; }
        [AllowHtml]
        public string MSE { get; set; }
        public string PsychImpression { get; set; }
        public string Assessment { get; set; }
        public string Plan { get; set; }
        public int StaffId { get; set; }
        [ForeignKey(nameof(StaffId))]
        public ApplicationUser Staff { get; set; }
    }

    public class ClinicalSummaryMedication
    {
        [Key] 
        public int Id { get; set; }
        public  int ClinicalSummaryId { get; set; }
        [ForeignKey(nameof(ClinicalSummaryId))]
        public ClinicalSummary ClinicalSummary { get; set; }
        public int MedicationId { get; set; }
        [ForeignKey(nameof(MedicationId))]
        public Medication Medication { get; set; }
        public string Detail { get; set; }
    }

    public class NightLog
    {
        [Key]
        public int Id { get; set; }
        public int PatientId { get; set; }
        [ForeignKey(nameof(PatientId))]
        public ApplicationUser Patient { get; set; }
        public DateTime DateOfAdmission { get; set; }
        public List<NightLogTime> NightLogTimes { get; set; }
    }

    public class NightLogTime
    {
        [Key]
        public int Id { get; set; }
        public int NightLogId { get; set; }
        [ForeignKey(nameof(NightLogId))]
        public NightLog NightLog { get; set; }
        public string SleepStatus { get; set; }
        public int? StaffId { get; set; }
        [ForeignKey(nameof(StaffId))]
        public ApplicationUser Staff { get; set; }
        public string Comments { get; set; }
        public DateTime TimeStamp { get; set; }
    }
    public class Appointment
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public List<ApplicationUser> Members { get; set; }
    }

    [Table("ContactForm")]
    public class ContactForm
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string City { get; set; }
        public string Company { get; set; }
        public int Candidates { get; set; }
    }

    //var ClinicalSummary = new
    //{
    //    Name = "jane Doe",
    //    Dob = "1/jan/2000",
    //    Cc = "I got lower back issues and anxiety.",
    //    Hpi = "Patient is a 46-year-old male with a history of bipolar disorder.  “It’s mainly depression.”  Describes how he has had manic episodes.  Describes how he was using – Ativan and Hydrocodone and Oxycodone.  “I need something for my back.” He describes he is in chronic pain. “Trigger for anxiety- death, money.”  “I’ve had 5 people to die in five years.”  -my partner, mother, stepfather, and friend.  Living in transitional housing with 11 people.  Describes how he was taking care of his stepfather.  Describes how he was a manager at one time.  Last manic one year.  – “I beat someone up.” Physical aggression towards others- one incident.  Reports 2008, 2010- suicide attempts- 2008 attempted suicide by overdose and in 2010 attempted suicide.  History of cutting- with the last incident 6 months ago.  Describes how he feels as alcohol is the main factor.  Describes that he has been in detox for 15 times.  He describes how he has been in several detox programs.  “Within two hours I was back drinking again after I was discharged.”  Denies SI/HI.  Denies AVH. — “Sometimes I hear stuff, but I try to ignore it.”    Describes how he hears the voices more when he is drinking alcohol.  Describes how he has seen different things when he has been drinking- “People walking out of the walls.”  Describes how the voices are in his head.",
    //    Pmh = "Hypertension, Alcohol induced seizures.",
    //    Psh = "Calcium deposit removed, GI endoscopy, Eye surgery- vision 20/50 left eye",
    //    ObpregHx = "abc",
    //    Alcohol = "2 weeks ago",
    //    Marijuana = "Denies",
    //    Cocaine = "20 years ago",
    //    Heroin = "Denies use",
    //    Nicotin = "Half a pack per day",
    //    drug = "Paracetamol",
    //    Lastused = "alcohol two weeks ago",
    //    Caffeine = "Denies",
    //    Mother = "2017- Cancer COPD born in 1940-Mother died at the age of 77 --- History of alcoholism",
    //    Father = "died – History of Alcoholism.",
    //    Grandmother = "died – History of Alcoholism.",
    //    Jobhistory = "Engineer",
    //    Medications = "Latuda 40mg one tablet by mouth every evening with food, Vistaril 50mg three times a day as needed for anxiety",
    //    Allergies = "NKDA",
    //    Appearance = "disheveled",
    //    Behavior = "calm and cooperative",
    //    Motorresponse = "No abnormal movements",
    //    Eyecontact = "good",
    //    Speech = "RRR",
    //    Affect = "labile",
    //    Mood = "Labile",
    //    ThoughtContent = "Concerned about housing and plans after treatment. Denies SI/HI",
    //    ThoughtProcess = "logical and goal directed",
    //    Perceeptualdisturbance = "History of AVH",
    //    Orientation = "alert and oriented",
    //    Memory = "fair",
    //    Insight = "poor",
    //    Judgement = "poor",
    //    Focus = "Poor",
    //    PsychImpression = "Patient is a 46-year-old male with a history of Bipolar I Disorder, most recent incident depress and Alcohol Dependence uncomplicated.",
    //    Assesment = "Alcohol Dependence uncomplicated, Bipolar I Disorder Most recent incident Depress.",
    //    Plan = "Continue current medication of Divalproex ER 1500mg once a day, Gabapentin 300mg three times a day, Latuda 40mg one tablet by mouth every evening with food, and Vistaril 50mg take one tablet three times a day.  "
    //};




    //[Table(nameof(ClinicalSummary), Schema = Schemas.MAR)]
    //public class ClinicalSummary
    //{


    //    public Patient Patient { get; set; }
    //    public string Cc { get; set; }

    //    public string Hpi { get; set; }
    //    public string Pmh { get; set; }
    //    public string Psh { get; set; }

    //    public string ObpregHx { get; set; }

    //    public string Alcohol = "2 weeks ago",
    //    public string Marijuana = "Denies",
    //    public string Cocaine = "20 years ago",
    //    public string Heroin = "Denies use",
    //   public string Nicotin = "Half a pack per day",
    //   public string drug = "Paracetamol",
    //   public DateTime LastUsed = "alcohol two weeks ago",
    //   public string Caffeine = "Denies",
    //   public string Mother = "2017- Cancer COPD born in 1940-Mother died at the age of 77 --- History of alcoholism",
    //   public string Father = "died – History of Alcoholism.",
    //   public string Grandmother = "died – History of Alcoholism.",
    //   public string Jobhistory = "Engineer",
    //   public string Medications = "Latuda 40mg one tablet by mouth every evening with food, Vistaril 50mg three times a day as needed for anxiety",
    //   public string Allergies = "NKDA",
    //   public string Appearance = "disheveled",
    //    Behavior = "calm and cooperative",
    //    Motorresponse = "No abnormal movements",
    //    Eyecontact = "good",
    //    Speech = "RRR",
    //    Affect = "labile",
    //    Mood = "Labile",
    //    ThoughtContent = "Concerned about housing and plans after treatment. Denies SI/HI",
    //    ThoughtProcess = "logical and goal directed",
    //    Perceeptualdisturbance = "History of AVH",
    //    Orientation = "alert and oriented",
    //    Memory = "fair",
    //    Insight = "poor",
    //    Judgement = "poor",
    //    Focus = "Poor",
    //    PsychImpression = "Patient is a 46-year-old male with a history of Bipolar I Disorder, most recent incident depress and Alcohol Dependence uncomplicated.",
    //    Assesment = "Alcohol Dependence uncomplicated, Bipolar I Disorder Most recent incident Depress.",
    //    Plan = "Continue current medication of Divalproex ER 1500mg once a day, Gabapentin 300mg three times a day, Latuda 40mg one tablet by mouth every evening with food, and Vistaril 50mg take one tablet three times a day.  "


    //    [Key]
    //    public int Id { get; set; }
    //    public int PatientId { get; set; }
    //    [ForeignKey(nameof(PatientId))]
    //    public Patient Patient { get; set; }
    //    public DateTime Date { get; set; }
    //    public List<Goal> Goals { get; set; }
    //    public string Signature { get; set; }
    //    public int StaffId { get; set; }
    //    [ForeignKey(nameof(StaffId))]
    //    public ApplicationUser Staff { get; set; }

    //    public bool FirstShift { get; set; }
    //    public bool SecondShift { get; set; }
    //    public bool ThirdShift { get; set; }
    //    public bool FaceToFace { get; set; }
    //    public string Location { get; set; }

    //    [AllowHtml]
    //    public string Effectiveness { get; set; }
    //    [AllowHtml]
    //    public string Intervention { get; set; }

    //    [AllowHtml]
    //    public string Service { get; set; }
    //}



    [Table(nameof(TreatmentPlan), Schema = Schemas.MAR)]
    public class TreatmentPlan
    {
        [Key]
        public int Id { get; set; }
        public int PatientId { get; set; }
        [ForeignKey(nameof(PatientId))]
        public ApplicationUser Patient { get; set; }
        public DateTime Date { get; set; }
        public List<Goal> Goals { get; set; }
        public string Signature { get; set; }
        public int StaffId { get; set; }
        [ForeignKey(nameof(StaffId))]
        public ApplicationUser Staff { get; set; }

        public bool FirstShift { get; set; }
        public bool SecondShift { get; set; }
        public bool ThirdShift { get; set; }
        public bool FaceToFace { get; set; }
        public string Location { get; set; }

        [AllowHtml]
        public string Effectiveness { get; set; }
        [AllowHtml]
        public string Intervention { get; set; }

        [AllowHtml]
        public string Service { get; set; }
    }



    [Table(nameof(Goal), Schema = Schemas.MAR)]
    public class Goal
    {
        [Key]
        public int Id { get; set; }
        public string GoalName { get; set; }
        public string GoalTitle { get; set; }
        [AllowHtml]
        public string Description { get; set; }
    }





    [Table(nameof(MedicalRecord), Schema = Schemas.MAR)]
    public class MedicalRecord
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Record { get; set; }
        public int DoctorId { get; set; }
        [JsonIgnore]
        [ForeignKey(nameof(DoctorId))]
        public ApplicationUser Doctor { get; set; }
        public int PatientId { get; set; }
        [JsonIgnore]
        [ForeignKey(nameof(PatientId))]
        public ApplicationUser Patient { get; set; }
        public DateTime AdmissionDate { get; set; }
        public DateTime StartStopDate { get; set; }
        public string FacilityName { get; set; }
        public string Diagnosis { get; set; }
        public string Comments { get; set; }
        public string Allergies { get; set; }
        [JsonIgnore]
        public List<MedicalRecordStaff> Staff { get; set; }
        public List<NotAdministeredMedicine> NotAdministeredMedicines { get; set; }
        public List<AdministeredMedicine> AdministeredMedications { get; set; }
    }

    [Table(nameof(MedicalRecordStaff), Schema = Schemas.MAR)]
    public class MedicalRecordStaff
    {
        [Key, Column(Order = 0)]
        public int StaffId { get; set; }
        [ForeignKey(nameof(StaffId))]
        public ApplicationUser Staff { get; set; }
        [Key, Column(Order = 1)]
        public int MedicalRecordId { get; set; }
        [ForeignKey(nameof(MedicalRecordId))]
        public MedicalRecord MedicalRecord { get; set; }
        public override bool Equals(object obj)
        {
            var other = obj as MedicalRecordStaff;
            if (other == null) return false;
            if (StaffId == other.StaffId && MedicalRecordId == other.MedicalRecordId)
                return true;

            return false;
        }
        public override int GetHashCode()
        {
            int hashStaffId = StaffId.GetHashCode();
            int hashMarId = MedicalRecordId.GetHashCode();
            return hashStaffId ^ hashMarId;
        }

    }



    [Table(nameof(NotAdministeredMedicine), Schema = Schemas.MAR)]
    public class NotAdministeredMedicine
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int MarId { get; set; }
        [ForeignKey(nameof(MarId))]
        [JsonIgnore]
        public MedicalRecord MedicalRecord { get; set; }
        public int MedicationId { get; set; }
        [ForeignKey(nameof(MedicationId))]
        public Medication Medication { get; set; }
        public int StaffId { get; set; }
        [ForeignKey(nameof(StaffId))]
        public ApplicationUser Staff { get; set; }
        public DateTime Date { get; set; }
        public string Initials { get; set; }

        public string Reason { get; set; }
        public string Result { get; set; }

        public override bool Equals(object obj)
        {
            var other = obj as NotAdministeredMedicine;
            if (other == null) return false;
            if (StaffId == other.StaffId && MarId == other.MarId)
                return true;

            return false;
        }

        public override int GetHashCode()
        {
            int hashStaffId = StaffId.GetHashCode();
            int hashMarId = MarId.GetHashCode();
            return hashStaffId ^ hashMarId;
        }

    }

    [Table(nameof(Medication), Schema = Schemas.MAR)]
    public class Medication
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
    }


    [Table(nameof(AdministeredMedicine), Schema = Schemas.MAR)]
    public class AdministeredMedicine
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public int MedicationId { get; set; }
        [ForeignKey(nameof(MedicationId))]
        public Medication Medication { get; set; }

        public int MarId { get; set; }
        [ForeignKey(nameof(MarId))]
        [JsonIgnore]
        public MedicalRecord MedicalRecord { get; set; }
        public int StaffId { get; set; }
        [ForeignKey(nameof(StaffId))]
        public ApplicationUser Staff { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
    }

}


