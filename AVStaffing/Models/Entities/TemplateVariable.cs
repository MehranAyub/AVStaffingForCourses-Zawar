using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(TemplateVariable), Schema = Schemas.Emails)]
    public class TemplateVariable
    {
        [Key]
        public int Id { get; set; }
        public string Title { get; set; }
        public int EmailTemplateId { get; set; }
        [ForeignKey(nameof(EmailTemplateId))]
        public EmailTemplate EmailTemplate { get; set; }
    }
}