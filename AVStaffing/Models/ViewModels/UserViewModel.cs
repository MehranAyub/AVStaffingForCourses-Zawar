using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;
using AVStaffing.Infrastructure;

namespace AVStaffing.Models.ViewModels
{
    public class UserViewModel
    {
        public int Id { get; set; }
        public string Initials { get; set; }

        [Required]
        [MaxLength(50)]
        [Display(Name = "User Name")]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(30, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        [Display(Name = "First name")]
        public string Firstname { get; set; }

        [Required]
        [StringLength(30, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        [Display(Name = "Last name")]
        public string Lastname { get; set; }
     
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
        public List<ApplicationRole> Roles { get; set; }
        public List<int> SelectedRoles { get; set; }

        public string Language { get; set; }
        public string ImagePath { get; set; }
        public HttpPostedFileBase ImageFile { get; set; }
        public  string SignatureFile {get; set; }
        public string SignaturePath { get; set; }
        public DateTime DateOfBirth { get; set; }

        public string Gender { get; set; }
        public string PhoneNumber { get; set; }

        public UserViewModel()
        {
            this.Roles = new List<ApplicationRole>();
            this.SelectedRoles = new List<int>();
        }
    }
}