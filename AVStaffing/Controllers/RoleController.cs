using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models;
using AVStaffing.Models.ViewModels;

namespace AVStaffing.Controllers
{
    public class RoleController : BaseController
    {
        #region ROLES
        [Route("Roles")]
        [Permission("Roles => Role List")]
        public ActionResult RoleIndex()
        {
            List<ApplicationRole> _roles = ApplicationRoleManager.GetRoles();
            return View(_roles);
        }

        [Permission("Roles => Create Role")]
        public ActionResult RoleCreate(int id = 0)
        {
            var vm = new RoleViewModel();

            if (id != 0)
            {
                var role = ApplicationRoleManager.GetRole(id);

                var roleUsers = DbContext.Users
                    .Include(x => x.Roles)
                    .Where(x => x.Roles.Any(y => y.RoleId == role.Id))
                    .Select(x => x.Id).ToList();
                vm = new RoleViewModel
                {
                    Id = id,
                    Name = role.Name,
                    IsSysAdmin = role.IsSysAdmin,
                    PermissionIds = role.Permissions.Select(x => x.Id).ToList(),
                    UserIds = roleUsers,
                    RoleDescription = role.RoleDescription
                };
            }

            SetRoleViewBag();
            return View(vm);
        }

        public void SetRoleViewBag()
        {
            ViewBag.Users = ApplicationUserManager.GetUsers4SelectList();
            ViewBag.Permissions = ApplicationRoleManager.GetPermissions4SelectList();
        }

        [HttpPost]
        [Permission("Roles => Create Role")]
        public ActionResult RoleCreate(RoleViewModel _role)
        {
            if (ModelState.IsValid)
            {
                if (_role.Id == 0)
                {
                    ApplicationRole role = new ApplicationRole(_role.Name, _role.RoleDescription);
                    role.IsSysAdmin = _role.IsSysAdmin;
                    ApplicationRoleManager.CreateRole(role);
                    var r = DbContext.Roles.FirstOrDefault(x => x.Id == role.Id);
                    var permissions = DbContext.Permissions.Where(x => _role.PermissionIds.Contains(x.Id));
                    foreach (var p in _role.PermissionIds)
                    {
                        ApplicationRoleManager.AddPermission2Role(r.Id, p);
                    }
                    foreach (var u in _role.UserIds)
                    {
                        ApplicationUserManager.AddUser2Role(u, r.Id);
                    }
                    Notify("Success", "Created Successfully", "Role Created Successfully", isRedirectMessage: true);
                }
                else
                {

                    ApplicationRoleManager.UpdateRole(_role);
                    ApplicationRoleManager.RemoveAllPermission4Role(_role.Id);
                    ApplicationUserManager.RemoveAllUsers4Role(_role.Id);
                    foreach (var p in _role.PermissionIds)
                    {
                        ApplicationRoleManager.AddPermission2Role(_role.Id, p);
                    }
                    foreach (var u in _role.UserIds)
                    {
                        ApplicationUserManager.AddUser2Role(u, _role.Id);
                    }
                    Notify("Success", "Updated Successfully", "Role Updated Successfully", isRedirectMessage: true);
                }

                return RedirectToAction("RoleIndex");
            }
            SetRoleViewBag();
            return View(_role);
        }

        [Permission("Roles => Delete Role")]
        public JsonResult RoleDelete(int id)
        {
            try
            {
                ApplicationRoleManager.DeleteRole(id);
                Notify("Success", "Deleted Successfully", "Role Deleted Successfully", isAjaxMessage: true);
                return Json(true);
            }
            catch (Exception)
            {
                Notify("Error", "Technical Error", "Unable to delete role", isAjaxMessage: true);
                throw;
            }
        }

        #endregion
    }
}