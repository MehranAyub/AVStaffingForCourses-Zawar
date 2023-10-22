using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HapCss;
using Newtonsoft.Json;
using Twilio;
using Twilio.Jwt.AccessToken;
using Twilio.Rest.Video.V1;
using Token = Twilio.Jwt.AccessToken.Token;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using AVStaffing.Infrastructure;

namespace AVStaffing.Controllers
{

    public class VideoChatAuth
    {
        public string userId { get; set; }
        public int eventId { get; set; }
        public string type { get; set; }
    }

    public class VideoChatController : BaseController
    {

        [AllowAnonymous]
        public ActionResult Index(string q)
        {
            var str = Aes256CbcEncrypter.Decrypt(q);
            var k = JsonConvert.DeserializeObject<dynamic>(str);
            int id = k.Id;
            int roomId = k.roomName;
            var user = DbContext.Users.FirstOrDefault(x => x.Id == id);
            var room = DbContext.Appointments.Include(x => x.Members).FirstOrDefault(x => x.Id == roomId);
            if (room.Members.FirstOrDefault(x => x.Id == id) == null) 
            {
                return RedirectToAction("~/Home/Index");
            }
            ViewBag.User = user;
            ViewBag.Room = room;
            var token = getToken(user.UserName, room.Name);
            ViewBag.Token = token;
            return View();
        }


        [AllowAnonymous]
        public ActionResult Index2()
        {
            return View();
        }



        public static string getToken(string username, string roomName)
        {
            var accountSid = "AC169b5753ae7de237055d064ae174549e";// ConfigurationManager.AppSettings["TwilioAccountSid"];
            var apiKey = "SKa7f6933e4c4d46002b2e2926b01edd40";// ConfigurationManager.AppSettings["TwilioApiKey"];
            var apiSecret = "xJacIOUiYLWNLQpOsAQn7iwnIVOkeGAG";// ConfigurationManager.AppSettings["TwilioApiSecret"];
            var identity = new { username };

            var grant = new VideoGrant();
            grant.Room = roomName;
            var grants = new HashSet<IGrant> { grant };

            // Create an Access Token generator
            var token = new Token(accountSid, apiKey, apiSecret, identity: JsonConvert.SerializeObject(identity), grants: grants);
            return token.ToJwt();
        }

    }
}