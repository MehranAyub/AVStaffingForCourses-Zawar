using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using AVStaffing.Models;
using AVStaffing.Models.ViewModels;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using AVStaffing.Models.Entities;

namespace AVStaffing.Infrastructure
{
    public class ApplicationRoleManager : RoleManager<ApplicationRole, int>
    {
        public ApplicationRoleManager(IRoleStore<ApplicationRole, int> roleStore) : base(roleStore)
        {
        }

        public static ApplicationRoleManager Create(IdentityFactoryOptions<ApplicationRoleManager> options, IOwinContext context)
        {
            var appRoleManager = new ApplicationRoleManager(new ApplicationRoleStore(context.Get<ApplicationDbContext>()));

            return appRoleManager;
        }



        public static List<ApplicationRole> GetRoles()
        {
            List<ApplicationRole> _retVal = null;
            try
            {
                using (RoleStore<ApplicationRole, int, ApplicationUserRole> db = new RoleStore<ApplicationRole, int, ApplicationUserRole>(new ApplicationDbContext()))
                {
                    _retVal = db.Roles.Include("Permissions").ToList();
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static ApplicationRole GetRole(int _roleId)
        {
            ApplicationRole _retVal = null;
            try
            {
                using (RoleStore<ApplicationRole, int, ApplicationUserRole> db = new RoleStore<ApplicationRole, int, ApplicationUserRole>(new ApplicationDbContext()))
                {
                    _retVal = db.Roles.Where(p => p.Id == _roleId).Include(x=>x.Permissions).FirstOrDefault();
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static bool CreateRole(ApplicationRole _role)
        {
            bool _retVal = false;
            try
            {
                var roleManager = new RoleManager<ApplicationRole, int>(new RoleStore<ApplicationRole, int, ApplicationUserRole>(new ApplicationDbContext()));
                if (!roleManager.RoleExists(_role.Name))
                {
                    _role.LastModified = DateTime.Now;
                    roleManager.Create(_role);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return _retVal;
        }

        public static bool AddPermission2Role(int _roleId, int _permissionId)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    ApplicationRole role = db.Roles.Where(p => p.Id == _roleId).Include(x=>x.Permissions).FirstOrDefault();
                    if (role != null)
                    {
                        Permission _permission = db.Permissions.Where(p => p.Id == _permissionId).Include(x=>x.Roles).FirstOrDefault();
                        if (!role.Permissions.Contains(_permission))
                        {
                            role.Permissions.Add(_permission);
                            role.LastModified = DateTime.Now;
                            db.Entry(role).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return _retVal;
        }

        public static bool AddAllPermissions2Role(int _roleId)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    ApplicationRole role = db.Roles.Where(p => p.Id == _roleId).Include("Permissions").FirstOrDefault();
                    if (role != null)
                    {
                        List<Permission> _permissions = db.Permissions.Include("ROLES").ToList();
                        foreach (Permission _permission in _permissions)
                        {
                            if (!role.Permissions.Contains(_permission))
                            {
                                role.Permissions.Add(_permission);
                            }
                        }
                        role.LastModified = DateTime.Now;
                        db.Entry(role).State = EntityState.Modified;
                        db.SaveChanges();
                        _retVal = true;
                    }
                }
            }
            catch
            {
            }
            return _retVal;
        }

        public static bool UpdateRole(RoleViewModel _modifiedRole)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    ApplicationRole _role2Modify = db.Roles.Where(p => p.Id == _modifiedRole.Id).Include("Permissions").FirstOrDefault();

                    db.Entry(_role2Modify).Entity.Name = _modifiedRole.Name;
                    db.Entry(_role2Modify).Entity.RoleDescription = _modifiedRole.RoleDescription;
                    db.Entry(_role2Modify).Entity.IsSysAdmin = _modifiedRole.IsSysAdmin;
                    db.Entry(_role2Modify).Entity.LastModified = System.DateTime.Now;
                    db.Entry(_role2Modify).State = EntityState.Modified;
                    db.SaveChanges();

                    _retVal = true;
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static bool DeleteRole(int _roleId)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    ApplicationRole _role2Delete = db.Roles.Where(p => p.Id == _roleId).Include("Permissions").FirstOrDefault();
                    if (_role2Delete != null)
                    {
                        _role2Delete.Permissions.Clear();
                        db.Entry(_role2Delete).State = EntityState.Deleted;
                        db.SaveChanges();
                        _retVal = true;
                    }
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static bool RemovePermission4Role(int _roleId, int _permissionId)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    ApplicationRole _role2Modify = db.Roles.Where(p => p.Id == _roleId).Include(x=>x.Permissions).FirstOrDefault();
                    Permission _permission = db.Permissions.Where(p => p.Id == _permissionId).Include(x=>x.Roles).FirstOrDefault();

                    if (_role2Modify.Permissions.Contains(_permission))
                    {
                        _role2Modify.Permissions.Remove(_permission);
                        _role2Modify.LastModified = DateTime.Now;
                        db.Entry(_role2Modify).State = EntityState.Modified;
                        db.SaveChanges();

                        _retVal = true;
                    }
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static bool RemoveAllPermission4Role(int _roleId)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    ApplicationRole _role2Modify = db.Roles.Where(p => p.Id == _roleId).Include(x => x.Permissions).FirstOrDefault();
                    _role2Modify.Permissions = new List<Permission>();
                    _role2Modify.LastModified = DateTime.Now;
                    db.Entry(_role2Modify).State = EntityState.Modified;
                    db.SaveChanges();
                    _retVal = true;
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }



        public static List<ApplicationRole> GetRoles4SelectList()
        {
            List<ApplicationRole> _retVal = null;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    _retVal = db.Roles.OrderBy(p => p.Name).ToList();
                }
            }
            catch (Exception)
            {
            }

            return _retVal;
        }

        public static List<Permission> GetPermissions4SelectList()
        {
            List<Permission> _retVal = null;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    _retVal = db.Permissions.OrderBy(p => p.Description).ToList();
                }
            }
            catch (Exception)
            {
            }

            return _retVal;
        }

        #region Worker functions for Permissions
        public static List<Permission> GetPermissions()
        {
            List<Permission> _retVal = null;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    _retVal = db.Permissions.OrderBy(p => p.Description).Include("ROLES").ToList();
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static Permission GetPermission(int _permissionid)
        {
            Permission _retVal = null;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    _retVal = db.Permissions.Where(p => p.Id == _permissionid).Include(x=>x.Roles).FirstOrDefault();
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        /*public static Permission GetPermission4Description(string _permDescription)
        {
            Permission _retVal = null;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    _retVal = db.Permissions.Where(p => p.PermissionDescription == _permDescription).Include("ROLES").FirstOrDefault();
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }*/


        public static bool AddPermission(Permission _newPermission)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    db.Permissions.Add(_newPermission);
                    db.Entry(_newPermission).State = EntityState.Added;
                    db.SaveChanges();
                    _retVal = true;
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static bool UpdatePermission(Permission _permission)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    db.Entry(_permission).State = EntityState.Modified;
                    db.SaveChanges();
                    _retVal = true;
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }

        public static bool DeletePermission(int _permissionId)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    var _permission = db.Permissions.Where(p => p.Id == _permissionId).Include(x=>x.Roles).FirstOrDefault();

                    _permission.Roles.Clear();
                    db.Entry(_permission).State = EntityState.Deleted;
                    db.SaveChanges();
                    _retVal = true;
                }
            }
            catch (Exception)
            {
            }
            return _retVal;
        }
        #endregion
    }
}