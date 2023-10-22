using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(EmailTemplate), Schema = Schemas.Emails)]
    public class EmailTemplate
    {
        [Key]
        public int Id { get; set; }
        public int EmailTemplateType { get; set; }
        public string Title { get; set; }
        public string Subject { get; set; }
        [AllowHtml]
        public string Body { get; set; }
        public string Language { get; set; }

        public List<TemplateVariable> Variables { get; set; }
    }
}