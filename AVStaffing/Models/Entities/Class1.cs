using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AVStaffing.Models.Entities
{
    [Table("Person")]
    public class Person
    {
        [Key]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string SIN { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string HomePhone { get; set; }
        public string Gender { get; set; }
        public string CellPhone { get; set; }
        public string FullTimeStudent { get; set; }
        public bool HasWorkPermit { get; set; }
        public string DriverLicence { get; set; }
        public string PermanentResidence { get; set; }
        public string CANCitizen { get; set; }
        public string CriminalOffense { get; set; }
        public string PositionType { get; set; }
        public string EmploymentStatus { get; set; }
        public DateTime? AvailableDate { get; set; }
        public string JobType { get; set; }
        public string Education { get; set; }
        public string IsLegallyAllowedInCanada { get; set; }
    }
}