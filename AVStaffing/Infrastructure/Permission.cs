using Humanizer;
using AVStaffing.Models.Entities;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;
using System.Web.Mvc;

namespace AVStaffing.Infrastructure
{
    [Table(nameof(Permission))]
    public class Permission
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Controller { get; set; }
        [Required]
        public string Action { get; set; }

        public bool AllowAll { get; set; }

        [Required]
        [StringLength(50)]
        public string Description { get; set; }
        public virtual List<ApplicationRole> Roles { get; set; }



        public static void ImportPermission()
        {
            var dbContext = new ApplicationDbContext();
             var permissions = dbContext.Permissions.ToList();
             dbContext.Permissions.RemoveRange(permissions);
             dbContext.SaveChanges();

             var controllerTypes = AppDomain.CurrentDomain.GetAssemblies()
                .SelectMany(a => a.GetTypes())
                .Where(t => t != null
                            && t.IsPublic
                            && t.Name.EndsWith("Controller", StringComparison.OrdinalIgnoreCase)
                            && !t.IsAbstract
                            && typeof(IController).IsAssignableFrom(t));

            var controllerMethods =
                controllerTypes.ToDictionary(controllerType => controllerType,
                    controllerType =>
                        controllerType.GetMethods(BindingFlags.Public | BindingFlags.Instance)
                            .Where(
                                m => typeof(ActionResult).IsAssignableFrom(m.ReturnType) &&
                                     !Attribute.IsDefined(m, typeof(AllowAnonymousAttribute))  && 
                                     !Attribute.IsDefined(m, typeof (ExcludeFromPermission))
                            ));

            foreach (var controller in controllerMethods)
            {
                var controllerName = controller.Key.Name;
                foreach (var controllerAction in controller.Value)
                {
                    var controllerActionName = controllerAction.Name;
                    if (controllerName.EndsWith("Controller"))
                    {
                        controllerName = controllerName.Substring(0, controllerName.LastIndexOf("Controller", StringComparison.Ordinal));
                    }

                    string permissionDescription = string.Empty;
                    if (Attribute.IsDefined(controllerAction, typeof(PermissionAttribute)))
                    {
                       var permissionAttrib = controllerAction.CustomAttributes.FirstOrDefault(x=>x.AttributeType ==  typeof(PermissionAttribute));
                       if(permissionAttrib != null)
                        permissionDescription = permissionAttrib.ConstructorArguments[0].Value.ToString();
                    }
                    if(string.IsNullOrWhiteSpace(permissionDescription))  permissionDescription = $"{controllerName} => {controllerActionName.Humanize()}";

                    var permission = dbContext.Permissions.FirstOrDefault(p => p.Description == permissionDescription);
                    if (permission != null) continue;
                    var perm = new Permission
                    {
                        AllowAll = true,
                        Controller =  controllerName,
                        Action =  controllerActionName,
                        Description = permissionDescription
                    };

                    
                    dbContext.Permissions.Add(perm);
                    dbContext.SaveChanges();
                }
            }



            foreach (var el in dbContext.Permissions.ToList())
            {
                LoadedPermissions.Permissions.GetOrAdd($"{el.Controller}-{el.AllowAll}", el);
            }

        }

    }
}