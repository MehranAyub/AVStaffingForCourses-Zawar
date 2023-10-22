using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Group = AVStaffing.Models.Entities.Group;

namespace AVStaffing.Controllers
{

    public static class HttpPostedFileBaseExtensions
    {
        public const int ImageMinimumBytes = 307200;

        public static bool IsImage(this HttpPostedFileBase postedFile)
        {
            //-------------------------------------------
            //  Check the image mime types
            //-------------------------------------------
            if (postedFile.ContentType.ToLower() != "image/jpg" &&
                        postedFile.ContentType.ToLower() != "image/jpeg" &&
                        postedFile.ContentType.ToLower() != "image/pjpeg" &&
                        postedFile.ContentType.ToLower() != "image/gif" &&
                        postedFile.ContentType.ToLower() != "image/x-png" &&
                        postedFile.ContentType.ToLower() != "image/png")
            {
                return false;
            }

            //-------------------------------------------
            //  Check the image extension
            //-------------------------------------------
            if (Path.GetExtension(postedFile.FileName).ToLower() != ".jpg"
                && Path.GetExtension(postedFile.FileName).ToLower() != ".png"
                && Path.GetExtension(postedFile.FileName).ToLower() != ".gif"
                && Path.GetExtension(postedFile.FileName).ToLower() != ".jpeg")
            {
                return false;
            }

            //-------------------------------------------
            //  Attempt to read the file and check the first bytes
            //-------------------------------------------
            try
            {
                if (!postedFile.InputStream.CanRead)
                {
                    return false;
                }
                //------------------------------------------
                //check whether the image size exceeding the limit or not
                //------------------------------------------ 
                if (postedFile.ContentLength > ImageMinimumBytes)
                {
                    return false;
                }

                byte[] buffer = new byte[ImageMinimumBytes];
                postedFile.InputStream.Read(buffer, 0, ImageMinimumBytes);
                string content = System.Text.Encoding.UTF8.GetString(buffer);
                if (Regex.IsMatch(content, @"<script|<html|<head|<title|<body|<pre|<table|<a\s+href|<img|<plaintext|<cross\-domain\-policy",
                    RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Multiline))
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }

            //-------------------------------------------
            //  Try to instantiate new Bitmap, if .NET will throw exception
            //  we can assume that it's not a valid image
            //-------------------------------------------

            try
            {
                using (var bitmap = new System.Drawing.Bitmap(postedFile.InputStream))
                {
                }
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                postedFile.InputStream.Position = 0;
            }

            return true;
        }
    }
    public class FileDetails
    {
        public string FilePath { get; set; }
        public string FileName { get; set; }
        public string Height { get; set; }
        public string Width { get; set; }
        public string ContentType { get; set; }
        public string SizeKB { get; set; }
    }

    class DateTimeToDateConvertor : IsoDateTimeConverter
    {
        public DateTimeToDateConvertor()
        {
            base.DateTimeFormat = "yyyy-MM-dd";
        }
    }
    public class UserVM
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName { get; set; }
        public string Email { get; set; }
        public string MobileNo { get; set; }
        [JsonConverter(typeof(DateTimeToDateConvertor))]
        public DateTime? DateOfBirth { get; set; }
        public string Gender { get; set; }
        public List<int> RoleID { get; set; }
        public string ImagePath { get; set; }
        public bool IsDeleted { get; set; }
        public string ConnectionId { get; set; }
        public bool Online { get; set; }
        public DateTime? LoginTime { get; set; }


        public UserVM(ApplicationUser user)
        {
            this.DateOfBirth = user.DateOfBirth;
            this.DisplayName = user.FirstName + " " + user.LastName;
            this.Email = user.Email;
            this.FirstName = user.FirstName;
            this.Gender = user.Gender;
            this.ImagePath = user.ImagePath;
            this.IsDeleted = user.Inactive;
            this.LastName = user.LastName;
            this.MobileNo = user.PhoneNumber;
            this.Online = true;
            this.RoleID = user.Roles.Select(x => x.RoleId).ToList();
            this.Username = user.UserName;
            this.ID = user.Id;
        }

        public UserVM() : base()
        {

        }
    }


    public class ChatVm
    {
        public Group Group { get; set; }
        public List<GroupChat> Messages { get; set; }
        public List<UserVM> GroupChatUsers { get; set; }
        public int MessagesCount { get; set; }
        public UserVM User { get; set; }

    }
    public class ChatController : BaseController
    {

        public ChatController()
        {
        }

        public ActionResult Chat(int groupId = 0)
        {
            if (groupId == 0)
            {
                var group = new Group
                {
                    Name = User.GetFullName() + "-" + RandomNumberGenerator.Create(),
                    IsDeleted = false,
                    GroupChat = new List<GroupChat>()
                }; 
                DbContext.Groups.Add(group);
                DbContext.SaveChanges();
                groupId = group.Id;
            }
            return View(GetChatVm(groupId));
        }


        public ChatVm GetChatVm(int groupId)
        {
            List<GroupChat> messages = DbContext.GroupChats.Where(x => x.GroupId == groupId).OrderByDescending(x=>x.TimeStamp).Skip(0).Take(10).ToList();
            var userIds = messages.Select(x => x.UserId).Distinct().ToList();
            List<UserVM> userList = DbContext.Users.Where(x => userIds.Contains(x.Id)).ToList().Select(x => new UserVM(x)).ToList();
            var user = SessionUser;
            var department = DbContext.Groups.FirstOrDefault(x => x.Id == groupId);
            int messageCount = DbContext.GroupChats.Count(x => x.GroupId == groupId);
            ChatVm vm = new ChatVm
            {
                GroupChatUsers = userList,
                Messages = messages,
                Group =  department,
                MessagesCount = messageCount,
                User = new UserVM(user)
            };
            return vm;
        }

        public JsonResult GetMoreMessages(int groupId, int Page)
        {
            int offset = Page * 10;
            var results = DbContext.GroupChats.Where(x => x.GroupId == groupId).Skip(offset).Take(10).ToList();
            return Json(results);
        }

        public JsonResult GetPrivateChat(int userFromId, int userToId, int Page)
        {
            int offset = Page * 10;
            var results = DbContext.PrivateChats.Where(x => x.UserFromId == userFromId && x.UserToId == userToId)
                .Skip(offset).Take(10).ToList();
            return Json(results);
        }


        public JsonResult GetUserData(int userId)
        {
            var user = DbContext.Users.FirstOrDefault(x => x.Id == userId);
            return Json(user);
        }




        public JsonResult LoadFile(HttpPostedFileBase MyFile)
        {
            return Json(false);
        }

        public JsonResult UploadFile(string dchatstr, HttpPostedFileBase MyFile)
        {
            GroupChat dchat = JsonConvert.DeserializeObject<GroupChat>(dchatstr);
            FileDetails details = new FileDetails
            {
                ContentType = MyFile.ContentType,
                FileName = MyFile.FileName,
                SizeKB = (MyFile.ContentLength / 1024).ToString()
            };

            if (HttpPostedFileBaseExtensions.IsImage(MyFile))
            {
                dchat.Type = "Image";
                var img = Image.FromStream(MyFile.InputStream, true, true);
                details.Height = img.Height.ToString();
                details.Width = img.Width.ToString();
            }
            else if (IsValidFile(MyFile))
            {
                dchat.Type = "File";
            }

            details.FileName = MyFile.FileName;
            details.FilePath = UploadFile(MyFile, "~/Public/GroupChats/");

            dchat.FileDetails = JsonConvert.SerializeObject(details);
            dchat.FilePath = details.FilePath;

            DbContext.GroupChats.Add(dchat);
            DbContext.SaveChanges();
            Notify("Success", "Succesffully saved", "User Saved successfully", true, false, false);
            return Json(dchat);
        }

        private bool IsValidFile(HttpPostedFileBase postedFile)
        {
            List<string> allowedArray = new List<string>() { ".doc", ".docx", ".pdf", ".txt", ".xlsx", ".xls", ".png", ".jpg", ".gif" };
            if (!allowedArray.Contains(Path.GetExtension(postedFile.FileName).ToLower()))
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        //public JsonResult InserCustomMessage(string Message)
        //{
        //    int userId = SessionUser.Id;
        //    PrivateChat message = new PrivateChat
        //    {
        //        ID = 0,
        //        UserID = user.ID,
        //        Message = Message
        //    };
        //    int iD = CustomMessageRepo.Insert(message);
        //    return Json(iD);
        //}
        //public JsonResult UpdateCustomMessage(int MessageID, string Message)
        //{
        //    int userID = user.ID;
        //    CustomMessage message = new CustomMessage
        //    {
        //        ID = MessageID,
        //        UserID = user.ID,
        //        Message = Message
        //    };
        //    CustomMessageRepo.Update(message);
        //    return Json(CustomMessageRepo.GetList(user.ID));
        //}
        //public JsonResult DeleteCustomMessage(int MessageID)
        //{
        //    CustomMessageRepo.Delete(MessageID);
        //    return Json(CustomMessageRepo.GetList(user.ID));
        //}

        //public JsonResult GetCustomMessages()
        //{
        //    return Json(CustomMessageRepo.GetList(user.ID));
        //}


        public JsonResult UploadFilePrivate(string pchatstr, HttpPostedFileBase MyFile)
        {
            PrivateChat pchat = JsonConvert.DeserializeObject<PrivateChat>(pchatstr);
            FileDetails details = new FileDetails
            {

                ContentType = MyFile.ContentType,
                FileName = MyFile.FileName,
                SizeKB = (MyFile.ContentLength / 1024).ToString()
            };

            if (HttpPostedFileBaseExtensions.IsImage(MyFile))
            {
                pchat.Type = "Image";
                var img = Image.FromStream(MyFile.InputStream, true, true);
                details.Height = img.Height.ToString();
                details.Width = img.Width.ToString();
            }
            else if (IsValidFile(MyFile))
            {
                pchat.Type = "File";
            }

            details.FileName = MyFile.FileName;
            details.FilePath = UploadFile(MyFile, "~/Public/GroupChats/");

            pchat.FileDetails = JsonConvert.SerializeObject(details);
            pchat.FilePath = details.FilePath;
            DbContext.PrivateChats.Add(pchat);
            DbContext.SaveChanges();
            Notify("Success", "Succesffully saved", "User Saved successfully", true, false, false);
            return Json(pchat);
        }


    }
}