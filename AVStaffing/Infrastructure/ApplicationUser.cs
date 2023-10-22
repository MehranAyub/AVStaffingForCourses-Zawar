using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using AVStaffing.Models.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Newtonsoft.Json;

namespace AVStaffing.Infrastructure
{
    public static class ExctentionMethods
    {
        public static string GetFullName(this System.Security.Principal.IPrincipal usr)
        {
            var fullNameClaim = ((ClaimsIdentity)usr.Identity).FindFirst("FullName");
            if (fullNameClaim != null)
                return fullNameClaim.Value;

            return "";
        }
    }

    public class ApplicationUser : IdentityUser<int, ApplicationUserLogin, ApplicationUserRole, ApplicationUserClaim>
    {

        [Required]
        [MaxLength(100)]
        public string FirstName { get; set; }
        [MaxLength(100)]
        public string LastName { get; set; }
        public string Initials { get; set; }
        [Required]
        public byte Level { get; set; }
        [Required]
        public DateTime JoinDate { get; set; }
        public DateTime LastModified { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool Inactive { get; set; }
        public string ImagePath { get; set; }
        public string Signature { get; set; }
        public string SupportedLanguage { get; set; }
        public string Gender { get; set; }
        public bool OnlineStatus { get; set; }
        public DateTime LoginTime { get; set; }

        [JsonIgnore]
        public List<Appointment> Rooms { get; set; }
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser, int> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            userIdentity.AddClaim(new Claim("FullName", FirstName + " " + LastName));
            userIdentity.AddClaim(new Claim("Email", Email));
            if (!string.IsNullOrWhiteSpace(ImagePath))
                userIdentity.AddClaim(new Claim("ImagePath", ImagePath));
            else
                userIdentity.AddClaim(new Claim("ImagePath", ""));


            return userIdentity;
        }



        public bool IsPermissionInUserRoles(string permission)
        {
            return Roles.Any(role => role.IsPermissionInRole(permission));
        }

        public bool IsSysAdmin()
        {
            return Roles.Any(x => x.IsSysAdmin);
        }
    }
}