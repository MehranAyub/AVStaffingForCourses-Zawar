using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(Media), Schema = Schemas.Content)]
    public class Media
    {
        [Key]
        public int Id { get; set; }
        public string MediaUrl { get; set; }
        public string FileName { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateUpdated { get; set; }
    }
}