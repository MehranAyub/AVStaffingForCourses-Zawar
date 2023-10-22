using System;
using System.Collections.Generic;
using System.Linq;
using AVStaffing.Hubs;
using AVStaffing.Infrastructure;
using Microsoft.AspNet.SignalR;
using PuppeteerSharp.Mobile;
using System.Web.Mvc;
using SelectListItem = System.Web.Mvc.SelectListItem;
using AVStaffing.Models.ViewModels;
using AVStaffing.LocalResource.Home.Contact;
using static Humanizer.On;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{
    
    public class HomeController : BaseController
    {

        public HomeController()
        {
        }

        public HomeController(
            ApplicationUserManager userManager,
            ApplicationSignInManager signInManager,
            ApplicationRoleManager applicationRoleManager,
            IHubContext<NotificationHub> hubContext)
            : base(userManager, signInManager, applicationRoleManager, hubContext)
        {

        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Index()
        {
            //EmailService email = new EmailService();
            //email.SendAsync(new Microsoft.AspNet.Identity.IdentityMessage { 
            //Destination = "zetawars@hotmail.com",
            //Body  ="Test",
            //Subject = "test"
            //}).GetAwaiter().GetResult();
            return View();

        }



        [AllowAnonymous]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


        [AllowAnonymous]
        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult Contact(ContactForm contact)
        {
            this.DbContext.ContactForms.Add(contact);
            this.DbContext.SaveChanges();
            Notify("Success", "Successfully submited", "Request submitted successfully", false, true, false);
            return View();
        }


        [AllowAnonymous]
        public ActionResult Services()
        {
           
            return View("HowItWorks");
        }
        [AllowAnonymous]
        public ActionResult ContentPage(int pageId)
        {
            var page = DbContext.Pages.First(x => x.Id == pageId);
            return View(page);
        }


   
        [AllowAnonymous]
        [HttpPost]
        public ActionResult AddPersonRequest(Person person)
        {
            this.DbContext.Person.Add(person);
            this.DbContext.SaveChanges();
            Notify("Success", "Successfully submited", "Request submitted successfully", false, false, true);
            return RedirectToAction("Index", "Home");

        }

        //[AllowAnonymous]
        //public ActionResult HowItWorks()
        //{

        //    return View();
        //}

        //[AllowAnonymous]
        //public ActionResult GuaranteedPayment()
        //{

        //    return View();
        //}
        [AllowAnonymous]
        public ActionResult Pocket63K()
        {

            return View();
        }

        //[AllowAnonymous]
        //public ActionResult HITECHGuaranteeQA()
        //{

        //    return View();
        //}



        [HttpGet]
        [AllowAnonymous]
        public ActionResult ChangeCurrentCulture(int id)
        {
            CultureHelper.CurrentCulture = id;
            Session["CurrentCulture"] = id;
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}
