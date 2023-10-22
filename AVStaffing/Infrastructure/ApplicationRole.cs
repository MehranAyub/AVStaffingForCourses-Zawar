using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNet.Identity.EntityFramework;

namespace AVStaffing.Infrastructure
{
    public class ApplicationRole : IdentityRole<int, ApplicationUserRole>
    {
        public ApplicationRole()
        {
            //this.Id = Guid.NewGuid().ToString();
        }
        public ApplicationRole(string name) : this()
        {
            Name = name;
        }

        public ApplicationRole(string name, string description) : this(name)
        {
            RoleDescription = description;
        }

        public DateTime LastModified { get; set; }
        public bool IsSysAdmin { get; set; }
        public string RoleDescription { get; set; }

        public virtual ICollection<Permission> Permissions { get; set; }

        public bool IsPermissionInRole(string permission)
        {
            var retVal = false;
            var p = LoadedPermissions.Permissions[permission];
            if (p == null) return false;
            if (p.AllowAll) return true;
            try
            {
                if (Permissions.Any(perm => perm.Controller == p.Controller && perm.Action == p.Action))
                {
                    retVal = true;
                }
            }
            catch (Exception)
            {
                // ignored
            }
            return retVal;
        }
    }



}