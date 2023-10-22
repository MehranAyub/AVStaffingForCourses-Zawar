using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using AVStaffing.Infrastructure;

namespace AVStaffing.Models.Entities
{
    [Table("AspNetUserNotifications")]
    public class Notification
    {
        [Key]
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Type { get; set; }
        [ForeignKey(nameof(UserId))]
        public ApplicationUser User { get; set; }
        public string Title { get; set; }
        [AllowHtml]
        public string Message { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsRead { get; set; }
        public bool IsDeleted { get; set; }
        public  bool IsReminder { get; set; }
        public string Code { get; set; }
    }
}