using System;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Models;
using  System.Data.Entity;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Entities;

namespace AVStaffing.Controllers
{
    public class ContentController : BaseController
    {
        [HttpGet]
        [Permission("Content => Company Portfolio")]
        public ActionResult Portfolios()
        {
            var list = DbContext.Portfolios.ToList();
            return View(list);
        }

        [HttpGet]
        [Permission("Content => Company Portfolio")]
        public ActionResult CompanyPortfolio(int id)
        {
            var portfolio = DbContext.Portfolios.FirstOrDefault(x => x.Id == id);
            return View(portfolio);
        }

        [HttpPost]
        [Permission("Content => Company Portfolio")]
        public ActionResult CompanyPortfolio(Portfolio portfolio)
        {

            if (portfolio.WhiteLogoImage != null)
            {
                var whiteLogoUploaded = UploadFile(portfolio.WhiteLogoImage, "~/Public/Logos/");
                portfolio.WhiteLogo = whiteLogoUploaded;
            }

            if (portfolio.BlackLogoImage != null)
            {
                var blackLogoUploaded = UploadFile(portfolio.BlackLogoImage, "~/Public/Logos/");
                portfolio.BlackLogo = blackLogoUploaded;
            }


            DbContext.Portfolios.AddOrUpdate(portfolio);
            DbContext.SaveChanges();
            ReloadContentInMemory();
            Notify("Success", "Successfully Updated", "Company Portfolio Updated Successfully");
            var p = DbContext.Portfolios.FirstOrDefault(x => x.Id == portfolio.Id);
            return View(p);
        }

        public void ReloadContentInMemory()
        {
            var portfolios = DbContext.Portfolios
                .Include(x => x.AboutUs)
                .Include(x => x.TermsOfService)
                .Include(x => x.Testimonials)
                .Include(x => x.ContactUs)
                .ToList();
            foreach (var p in portfolios)
            {
                if(LoadedPermissions.Portfolios.ContainsKey(p.Language))
                {
                    LoadedPermissions.Portfolios[p.Language] = p;
                }
            }
        }

        [HttpGet]
        [Permission("Content => Company Portfolio")]
        public ActionResult AboutUs(int id)
        {
            var aboutUs = DbContext.AboutUs.FirstOrDefault(x => x.PortfolioId == id);
            if (aboutUs == null)
            {
                aboutUs = new AboutUs();
                aboutUs.PortfolioId = id;
            }
            return View(aboutUs);
        }

        [HttpPost]
        [Permission("Content => Company Portfolio")]
        public ActionResult AboutUs(AboutUs aboutUs)
        {
            aboutUs.Portfolio = DbContext.Portfolios.FirstOrDefault(x => x.Id == aboutUs.PortfolioId);
            DbContext.AboutUs.AddOrUpdate(aboutUs);
            DbContext.SaveChanges();
            ReloadContentInMemory();
            Notify("Success", "Successfully Updated", "Company Portfolio Updated Successfully");
            var p = DbContext.AboutUs.FirstOrDefault(x => x.PortfolioId == aboutUs.PortfolioId);
            return View(p);
        }



        [HttpGet]
        [Permission("Content => Company Portfolio")]
        public ActionResult TermsOfService(int id)
        {
            var termsOfService = DbContext.TermsOfService.FirstOrDefault(x => x.PortfolioId == id);
            if (termsOfService == null)
            {
                termsOfService = new TermsOfService();
                termsOfService.PortfolioId = id;
            }
            return View(termsOfService);
        }

        [HttpPost]
        [Permission("Content => Company Portfolio")]
        public ActionResult TermsOfService(TermsOfService termsOfService)
        {
            termsOfService.Portfolio = DbContext.Portfolios.FirstOrDefault(x => x.Id == termsOfService.PortfolioId);
            termsOfService.DateUpdated = DateTime.UtcNow;
            DbContext.TermsOfService.AddOrUpdate(termsOfService);
            DbContext.SaveChanges();
            ReloadContentInMemory();
            Notify("Success", "Successfully Updated", "Company Portfolio Updated Successfully");
            var p = DbContext.TermsOfService.FirstOrDefault(x => x.PortfolioId == termsOfService.PortfolioId);
            return View(p);
        }



        [HttpGet]
        [Permission("Content => Company Portfolio")]
        public ActionResult ContactUs(int id)
        {
            var contactUs = DbContext.ContactUs.FirstOrDefault(x => x.PortfolioId == id);
            if (contactUs == null)
            {
                contactUs = new ContactUs();
                contactUs.PortfolioId = id;
            }
            return View(contactUs);
        }

        [HttpPost]
        [Permission("Content => Company Portfolio")]
        public ActionResult ContactUs(ContactUs contactUs)
        {
            contactUs.Portfolio = DbContext.Portfolios.FirstOrDefault(x => x.Id == contactUs.PortfolioId);
            DbContext.ContactUs.AddOrUpdate(contactUs);
            DbContext.SaveChanges(); 
            ReloadContentInMemory();
            Notify("Success", "Successfully Updated", "Company Portfolio Updated Successfully");
            var p = DbContext.ContactUs.FirstOrDefault(x => x.PortfolioId == contactUs.PortfolioId);
            return View(p);
        }



        [HttpGet]
        [Permission("Content => Company Portfolio")]
        public ActionResult Testimonials(int id)
        {
            ViewBag.portfolioId = id;
            var testimonials = DbContext.Testimonials.Where(x => x.PortfolioId == id).ToList();
            return View(testimonials);
        }

        [HttpGet]
        [Permission("Content => Company Portfolio")]
        public ActionResult AddTestimonial(int portfolioId, int id = 0)
        {
            var testimonial = DbContext.Testimonials.FirstOrDefault(x => x.Id == id);
            if (testimonial == null)
            {
                testimonial = new Testimonial {PortfolioId = id};
            }
            return View(testimonial);
        }

        [HttpPost]
        [Permission("Content => Company Portfolio")]
        public ActionResult AddTestimonial(Testimonial testimonial)
        {
            if (testimonial.ImageFile != null)
            {
                testimonial.ImagePath = UploadFile(testimonial.ImageFile, "~/Public/Content/Testimonials/");
            }

            DbContext.Testimonials.AddOrUpdate(testimonial);
            DbContext.SaveChanges();
            ReloadContentInMemory();
            Notify("Success", "Successfully Saved", "Testimonial saved Successfully", isRedirectMessage: true);
            return RedirectToAction("Testimonials", "Content", new {id = testimonial.PortfolioId});
        }

        [HttpPost]
        [Permission("Content => Company Portfolio")]
        public ActionResult DeleteTestimonial(int id)
        {
            var testimonial = DbContext.Testimonials.FirstOrDefault(x => x.Id == id);
            DbContext.Testimonials.Remove(testimonial);
            DbContext.SaveChanges();
            ReloadContentInMemory();
            Notify("Success", "Successfully Saved", "Testimonial saved Successfully", isRedirectMessage: true);
            return Json(true);
        }



        [HttpGet]
        [Permission("Content => Email Templates")]
        public ActionResult EmailTemplates()
        {
            var emailTemplates = DbContext.EmailTemplates.Include(x => x.Variables).ToList();
            return View(emailTemplates);
        }

        [HttpGet]
        [Permission("Content => Edit Email Templates")]
        public ActionResult AddEmailTemplate(int id)
        {
            var template = DbContext.EmailTemplates.Include(x=>x.Variables).FirstOrDefault(x => x.Id == id);
            if (template == null)
            {
                template = new EmailTemplate();
                template.Id = id;
            }
            return View(template);
        }

        [HttpPost]
        [Permission("Content => Edit Email Templates")]
        public ActionResult AddEmailTemplate(EmailTemplate template)
        {
            DbContext.EmailTemplates.AddOrUpdate(template);
            DbContext.SaveChanges();
            ReloadContentInMemory();
            Notify("Success", "Successfully Updated", "Email Template Updated Successfully");
            var p = DbContext.EmailTemplates.FirstOrDefault(x => x.Id == template.Id);
            return View(p);
        }


        [HttpPost]
        [ExcludeFromPermission]
        public ActionResult AddMedia()
        {
            var files = Request.Files;
            if (files[0] == null)
            {
                return Json(false);
            }
            string url = UploadFile(files[0]);
            var media = new Media
            {
                DateCreated = DateTime.UtcNow,
                DateUpdated = DateTime.UtcNow,
                FileName = Path.GetFileName(files[0].FileName),
                MediaUrl = url
            };
            DbContext.Medias.Add(media);
            DbContext.SaveChanges();
            ReloadContentInMemory();
            media.MediaUrl = Url.Content(media.MediaUrl);
            return Json(media);
        }


        [HttpGet]
        [ExcludeFromPermission]
        public ActionResult GetMedia()
        {
            var imageList = DbContext.Medias.ToList();
            
            return Json(imageList.Select(x=>new {title = x.FileName, value = Url.Content( x.MediaUrl )}), JsonRequestBehavior.AllowGet);
        }

        
    }
}