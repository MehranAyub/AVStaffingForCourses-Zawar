namespace AVStaffing.Models.Entities
{
    public class NotificationMessage : Notification
    {
        public bool IsAjaxMessage { get; set; }
        public bool IsRedirectMessage { get; set; }
        public bool IsViewMessage { get; set; }
    }
}