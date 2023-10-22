using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(Worker), Schema = Schemas.Workers)]
    public class Worker
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public string Nickname { get; set; }
        public string Town { get; set; }
        public string Province { get; set; }
        public string City { get; set; }
        [Required]
        public  string Country { get; set; }
        public string PostCode { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Mobile { get; set; }
        public string Gender { get; set; }
        public List<WorkerSkill> Skills { get; set; }
        public int MinSalary { get; set; }
        public int MaxSalary { get; set; }
        public int? CompanyId { get; set; }
        [ForeignKey(nameof(CompanyId))]
        public Company Company { get; set; }

        public int ContractTermMonths { get; set; }

        public string CVPath { get; set; }
        public string VideoPath { get; set; }

        public int UserId { get; set; }

        [ForeignKey(nameof(UserId))]
        public ApplicationUser User { get; set; }
        [NotMapped] public HttpPostedFileBase CVFile { get; set; }
        [NotMapped] public HttpPostedFileBase VideoFile { get; set; }

    }

    [Table(nameof(WorkerSkill), Schema = Schemas.Workers)]
    public class WorkerSkill
    {
        [Key, Column(Order = 0)]
        public int WorkerId { get; set; }
        public Worker Worker { get; set; }
        [Key, Column(Order = 1)]
        public int SkillId { get; set; }
        public Skill Skill { get; set; }
        public string SkillLevel { get; set; }
    }

    [Table(nameof(Company), Schema = Schemas.Workers)]
    public class Company
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Reference { get; set; }
        public string Address { get; set; }
        public  string Contact { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }

        public List<Worker> Workers { get; set; }


    }

    [Table(nameof(Skill), Schema = Schemas.Workers)]
    public class Skill
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Title { get; set; }
        public List<WorkerSkill> Skills { get; set; }

    }

    [Table(nameof(ContractTerm), Schema = Schemas.Workers)]
    public class ContractTerm
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public int Months { get; set; }
    }
}


//Worker ID(Each worker must have an ID reference number for searching )
//First Name:
//Surname:
//Nickname:
//Town
//Province
//City
//Country
//PostCode
//email
//mobile
//Male/Female
//Job Skills(from pull down menu or other)
//Search criteria(must be able to search on ID Reference, Surname, City, Country,
//email )
//Contract Term
//Name of Company, Company ID reference, Address, Contact, Address, Phone,
//email,
//Joseph Johnson
//Managing Director
//Building Company Ltd
//57 (Second Floor),
//Manchester Street
//London
//N1 6NN
//United Kingdom
//Company Identification – must be able to search on Name of Company.
//Job Skills
//Job Skills Position Required Number Employees Salary
//1. Masons 20 USD 650 – 750
//2. Carpenters 20 USD 650 – 750
//3. Shattering Carpenters 20 USD 650 – 750
//4. Finishing Carpenters 20 USD 650 – 750
//5. Welders 10 USD 650 – 750
//6. Tile Fitters 10 USD 650 – 750
//7. Roofers 10 USD 650 – 750
//8. Concrete Workers 10 USD 650 – 750
//9. Dozer Loader(Earth Preparation 10 USD 650 – 750
//Machine Operators)
//10.Concrete Mixture Transport Drivers 10 USD 650 – 750
//11.Concrete Pump Car Operators 10 USD 650 – 750
//12.Hydraulic Mechanics 10 USD 650 – 750
//Search criteria A - must be able to search on Job Skills Criteria required, Company ID
//Reference & Employee ID Job skills, to enable us to know which Employee is suitable
//Contract Terms
//Contract Term 3 months
//Contract Term 6 months
//Contract Term 12 months
//Contract Term 18 months
//Contract Term 24 months
//When Company has selected an employee for a contract term
//Search criteria B(must be able to search on Company ID Reference & Employee ID
//reference job skills, to enable us to know which Employee is employed by which Company
//and on what contract term)