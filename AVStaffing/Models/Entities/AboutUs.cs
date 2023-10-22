using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(AboutUs), Schema = Schemas.Content)]
    public class AboutUs
    {
        [Key]
        public int PortfolioId { get; set; }

        [ForeignKey(nameof(PortfolioId))]
        [Required]
        public Portfolio Portfolio { get; set; }
        public string Title { get; set; }
        public string Subtitle { get; set; }

        [AllowHtml]
        public string Section1 { get; set; }
        [AllowHtml]
        public string Section2 { get; set; }
        [AllowHtml]
        public string Section3 { get; set; }
        [AllowHtml]
        public string Section4 { get; set; }

        [AllowHtml] 
        public string Section5 { get; set; }
    }
}