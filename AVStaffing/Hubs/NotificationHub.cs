using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Threading.Tasks;
using AVStaffing.Models;
using AVStaffing.Models.Entities;
using Microsoft.AspNet.SignalR;

namespace AVStaffing.Hubs
{

    public class GroupChatMessage
    {
        public int? ID { get; set; }
        public string DepartmentID { get; set; }
        public int? UserID { get; set; }
        public string Message { get; set; }
        public string FilePath { get; set; }
        public string Type { get; set; }
        public string FileDetails { get; set; }
        public DateTime? TimeStamp { get; set; }
        public string UserImage { get; set; }
        public string SenderName { get; set; }
    }


    public class UserVm
    {
        public string Type { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }

        public string ConnectionId { get; set; }

        public int GroupId { get; set; }

    }
    public class NotificationHub : Hub
    {
        public static readonly ConcurrentDictionary<int, UserHubModels> Users = new ConcurrentDictionary<int, UserHubModels>();

        private readonly ApplicationDbContext _context = new ApplicationDbContext();


        public HashSet<string> GetConnectionids(int userId)
        {
            try
            {
                return Users[userId].ConnectionIds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        //Logged Use Call  
        public void GetNotification()
        {
            try
            {
                var loggedUser = Context.User.Identity.GetUserId();
                //Get TotalNotification  
                var totalNotify = LoadNotifData(loggedUser);
                //Send To  
                if (!Users.TryGetValue(loggedUser, out var receiver)) return;
                var cid = receiver.ConnectionIds.FirstOrDefault();
                var hubContext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                hubContext.Clients.Client(cid).broadcaastNotif(totalNotify);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        //Specific User Call  
        public void SendNotification(int UserId)
        {
            //Get TotalNotification  
            string totalNotif = LoadNotifData(UserId);
            if (!string.IsNullOrWhiteSpace(totalNotif) && totalNotif != "0")
            {
                try
                {
                    //Send To  
                    if (!Users.TryGetValue(UserId, out var receiver)) return;
                    var cid = receiver.ConnectionIds.ToList();
                    var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                    foreach (var id in cid)
                    {
                        context.Clients.Client(id).broadcaastNotif(totalNotif);
                    }
                }
                catch (Exception ex)
                {
                    ex.ToString();
                }
            }
        }

        public void Notify(NotificationMessage message)
        {
            try
            {
                //Send To  
                if (!Users.TryGetValue(message.UserId, out var receiver)) return;
                var cid = receiver.ConnectionIds.ToList();
                var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                foreach (var id in cid)
                {
                    context.Clients.Client(id).notify(message);
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        private string LoadNotifData(int userId)
        {
            return _context.Notifications.Count(x => x.UserId == userId && x.IsRead == false && x.IsDeleted == false).ToString();
        }


        public override Task OnConnected()
        {
            int userId = Context.User.Identity.GetUserId();
            string connectionId = Context.ConnectionId;

            string username = Context.QueryString["groupName"];
            Groups.Add(Context.ConnectionId, username);
            
            var user = Users.GetOrAdd(userId, _ => new UserHubModels
            {
                UserId = userId,
                ConnectionIds = new HashSet<string>()
            });

            lock (user.ConnectionIds)
            {
                user.ConnectionIds.Add(connectionId);
                if (user.ConnectionIds.Count == 1)
                {
                    Clients.Others.userConnected(userId);
                }
            }

            return base.OnConnected();
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            int userId = Context.User.Identity.GetUserId();
            string connectionId = Context.ConnectionId;

            UserHubModels user;
            Users.TryGetValue(userId, out user);
            Clients.All.onUserDisconnected(Context.ConnectionId);
            if (user != null)
            {
                lock (user.ConnectionIds)
                {
                    user.ConnectionIds.RemoveWhere(cid => cid.Equals(connectionId));
                    if (!user.ConnectionIds.Any())
                    {
                        UserHubModels removedUser;
                        Users.TryRemove(userId, out removedUser);
                        Clients.Others.userDisconnected(userId);
                    }
                }
            }
            return base.OnDisconnected(stopCalled);

        }



        public void Send(string groupName, GroupChatMessage dchat)
        {
            dchat.TimeStamp = DateTime.Now;
            Clients.Group(groupName).AddMessage(dchat);
        }


        public void Connect(UserVm vm)
        {
            var connectionId = Context.ConnectionId;
            var user = Users.GetOrAdd(vm.Id, _ => new UserHubModels
            {
                UserId = vm.Id,
                ConnectionIds = new HashSet<string>()
            });

            lock (user.ConnectionIds)
            {
                user.ConnectionIds.Add(connectionId);
                if (user.ConnectionIds.Count == 1)
                {
                    Clients.Others.userConnected(vm.Id);
                }
            }

        }


        public void SendPrivateMessage(PrivateChat pChat)
        {
            var fromUserId = Context.ConnectionId;
            pChat.TimeStamp = DateTime.Now;
            pChat.UserFromContextId = fromUserId;
            if (!string.IsNullOrEmpty(pChat.UserToContextId))
            {
                Clients.Client(pChat.UserToContextId).recievePrivateMessage(pChat);
            }
            Clients.Caller.sendPrivateMessage(pChat);
        }


    }


    public class NotifModels
    {
        public int UserID { get; set; }
        public string Message { get; set; }
    }

    public class UserHubModels
    {
        public int UserId { get; set; }
        public HashSet<string> ConnectionIds { get; set; }
    }
}