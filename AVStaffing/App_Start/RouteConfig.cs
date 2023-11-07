using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Entities;

namespace AVStaffing
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.MapRoute(
            //    name: "About",
            //    url: "About",
            //    defaults: new { controller = "Home", action = "About" }
            //);

            routes.MapRoute(
                name: "Home",
                url: "Home/Index",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Contact",
                url: "Contact",
                defaults: new { controller = "Home", action = "Contact" }
            );
            routes.MapRoute(
                name: "Course",
                url: "Course",
                defaults: new { controller = "Course", action = "Index" }
            );
            //routes.MapRoute(
            //    name: "HowItWorks",
            //    url: "how-it-works",
            //    defaults: new { controller = "Home", action = "ContentPage", pageId = 8 }
            //);



            var dbContext = new ApplicationDbContext();
            var pages = dbContext.Pages.ToList();
            foreach (var page in pages)
            {
                if (page.Route.ToLower() != "home"  &&  page.Route.ToLower() != "contact")
                {
                    var route = page.Route.Trim().ToLower().Replace(" ", "-");
                    routes.MapRoute(
                        name: route,
                        url: route,
                        defaults: new { controller = "Home", action = "ContentPage", pageId = page.Id }
                    );
                }
            }



            routes.MapRoute(
                name: "Dashboard",
                url: "Dashboard",
                defaults: new { controller = "Dashboard", action = "Index" }
            );
            routes.MapRoute(
                name: "Login",
                url: "Account/Login",
                defaults: new { controller = "Account", action = "Login" }
            );

            routes.MapRoute(
                name: "Register",
                url: "Account/Register",
                defaults: new { controller = "Account", action = "Register" }
            );

            
        
            routes.MapRoute(
                name: "AddUser",
                url: "User/AddUser",
                defaults: new { controller = "User", action = "AddUser", id = UrlParameter.Optional }
            );

            
            routes.MapRoute(
                name: "Profile",
                url: "User/UserProfile",
                defaults: new { controller = "User", action = "UserProfile" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
