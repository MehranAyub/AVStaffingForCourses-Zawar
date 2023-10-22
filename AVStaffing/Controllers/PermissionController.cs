using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using Hangfire;
using AVStaffing.Infrastructure;
using AVStaffing.Models;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{

    [Authorize(Roles = Roles.Admin+","+Roles.SuperAdmin)]
    public class PermissionController : BaseController
    {
        
        #region Permissions

        [Permission("Permission => Permission List")]
        public ViewResult Index()
        {
            return View(ApplicationRoleManager.GetPermissions());
        }
        [Permission("Permission => Permission Update")]
        public ActionResult Create(int id = 0)
        {
            if (id == 0) return View(new Permission());
            var permission = DbContext.Permissions.FirstOrDefault(x => x.Id == id);
            return View(permission);
        }

        [HttpPost]
        [Permission("Permission => Permission Update")]
        public ActionResult Create(Permission permission)
        {
            if (!ModelState.IsValid) return View(permission);

            if (permission.Id != 0)
            {
                var p = DbContext.Permissions.FirstOrDefault(x => x.Id == permission.Id);
                p.Description = permission.Description;
                p.AllowAll = permission.AllowAll;
                DbContext.SaveChanges();
                using (var dbContext = new ApplicationDbContext())
                {
                    var permissions = dbContext.Permissions.ToList();
                    foreach (var a in permissions)
                    {
                        LoadedPermissions.Permissions.GetOrAdd($"{a.Controller}-{a.Action}", a);
                    }
                }
                Notify("Success", "Successfully Updated", "Permission Updated Succesfully", isRedirectMessage: true);
            }
            else
            {
                ApplicationRoleManager.AddPermission(permission);
                Notify("Success", "Successfully Created", "Permission Created Succesfully", isRedirectMessage: true);
            }

            return RedirectToAction("Index");
        }

        [ExcludeFromPermission]
        public ActionResult PermissionsImport()
        {
            Permission.ImportPermission();
            return RedirectToAction("Index");
        }
        #endregion    
    }
}