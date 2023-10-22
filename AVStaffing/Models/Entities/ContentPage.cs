using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;

namespace AVStaffing.Models.Entities
{
    public class ContentPage
    {
        [Key]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Route { get; set; }
        public string NavTitle { get; set; }
        [AllowHtml]
        public string Content { get; set; }
        public int PageOrder { get; set; }
        public int? PageId { get; set; }
        [ForeignKey(nameof(PageId))]
        public ContentPage Page { get; set; }
        public List<ContentPage> Pages { get; set; }
    }
}