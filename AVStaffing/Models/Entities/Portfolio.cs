using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(Portfolio), Schema = Schemas.Content)]
    public class Portfolio
    {
        [Key]
        public int Id { get; set; }
        public string Language { get; set; }
        public string HomeTitle { get; set; }
        public string HomeSubTitle { get; set; }
        public string WhiteLogo { get; set; }
        public string BlackLogo { get; set; }

        [AllowHtml]
        public string Services { get; set; }
        public string TestimonialTitle { get; set; }
        public string TestimonialSubtitle { get; set; }
        public List<Testimonial> Testimonials { get; set; }
        public string PackagesTitle { get; set; }
        [AllowHtml]
        public string About { get; set; }

        public AboutUs AboutUs { get; set; }

        public ContactUs ContactUs { get; set; }

        public TermsOfService TermsOfService { get; set; }

        [NotMapped]
        public HttpPostedFileBase WhiteLogoImage { get; set; }

        [NotMapped]
        public HttpPostedFileBase BlackLogoImage { get; set; }

    }
}






