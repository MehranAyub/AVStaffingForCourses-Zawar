using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(TermsOfService), Schema = Schemas.Content)]
    public class TermsOfService
    {
        [Key]
        public int PortfolioId { get; set; }

        [ForeignKey(nameof(PortfolioId))]
        [Required]
        public Portfolio Portfolio { get; set; }

        public string Title { get; set; }
        public DateTime DateUpdated { get; set; }

        [AllowHtml]
        public string Description { get; set; }
    }
}