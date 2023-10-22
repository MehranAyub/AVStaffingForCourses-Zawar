using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;

namespace AVStaffing.Models
{
    [Table(nameof(Testimonial), Schema = Schemas.Content)]
    public class Testimonial
    {
        [Key]
        public int Id { get; set; }
        public string ImagePath { get; set; }
        public string ClientName { get; set; }
        public string ClientOccupation { get; set; }
        public string Text { get; set; }
        public int PortfolioId { get; set; }

        [ForeignKey(nameof(PortfolioId))]
        public Portfolio Portfolio { get; set; }

        [NotMapped] 
        public HttpPostedFileBase ImageFile { get; set; }

    }
}