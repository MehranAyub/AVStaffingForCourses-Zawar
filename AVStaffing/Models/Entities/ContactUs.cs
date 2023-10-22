using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(ContactUs), Schema = Schemas.Content)]
    public class ContactUs
    {
        [Key]
        public int PortfolioId { get; set; }

        [ForeignKey(nameof(PortfolioId))]
        [Required]
        public Portfolio Portfolio { get; set; }

        public string Title { get; set; }
        public string Subtitle { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }

    }
}