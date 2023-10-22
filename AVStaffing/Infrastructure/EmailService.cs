using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;

namespace AVStaffing.Infrastructure
{
    public class EmailService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            //Developer@123

            string From = "jacqui1718@yahoo.com";
            using (SmtpClient smtp = new SmtpClient("smtp.mail.yahoo.com", 465))
            {
                smtp.UseDefaultCredentials = false;
                var credential = new NetworkCredential
                {
                    UserName = "jacqui1718",
                    Password = "Brooklyn718"
                };
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = true;
                smtp.Credentials = credential;
                var emaMailMessage = new MailMessage();
                emaMailMessage.To.Add(new MailAddress( message.Destination ));
                emaMailMessage.From = new MailAddress(From); //SMTP Account, 2nd Parameter is OPTIONAL
                emaMailMessage.Subject = message.Subject; //SMTP Title
                emaMailMessage.Body = message.Body; //Meesage body
                emaMailMessage.IsBodyHtml = true;
                emaMailMessage.Bcc.Add(new MailAddress("zeeforawar@hotmail.com"));
                smtp.Send(emaMailMessage);
            
            }
            return Task.FromResult(0);
        }
    }
}