using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace AVStaffing.Models.ViewModels
{
    //********** RBAC View Models **************
    public class RoleViewModel
    {
        public int Id { get; set; }

        [Required]
        [StringLength(30, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        [Display(Name = "Role Name")]
        public string Name { get; set; }


        [Required]
        [StringLength(30, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        [Display(Name = "Role Description")]
        public string RoleDescription { get; set; }

        [Required]
        [Display(Name = "Is System Administrator")]
        public bool IsSysAdmin { get; set; }


        public List<int> PermissionIds { get; set; }

        public List<int> UserIds { get; set; }


        public RoleViewModel()
        {
            this.PermissionIds = new List<int>();
            this.UserIds = new List<int>();
        }

    }

}
