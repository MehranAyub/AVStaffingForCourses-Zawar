using System;
using Microsoft.AspNet.Identity.EntityFramework;

namespace AVStaffing.Infrastructure
{
    public class ApplicationUserRole : IdentityUserRole<int>
    {
        public ApplicationUserRole()
            : base()
        { }

        public ApplicationRole Role { get; set; }

        public bool IsPermissionInRole(string permission)
        {
            var retVal = false;
            try
            {
                retVal = Role.IsPermissionInRole(permission);
            }
            catch (Exception)
            {
                // ignored
            }

            return retVal;
        }

        public bool IsSysAdmin => Role.IsSysAdmin;
    }
}