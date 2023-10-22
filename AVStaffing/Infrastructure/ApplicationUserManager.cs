using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using AVStaffing.Models;
using AVStaffing.Models.ViewModels;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using AVStaffing.Models.Entities;

namespace AVStaffing.Infrastructure
{

    public class ApplicationUserStore : UserStore<ApplicationUser, ApplicationRole, int, ApplicationUserLogin, ApplicationUserRole, ApplicationUserClaim>, IUserStore<ApplicationUser, int>
    {
        public ApplicationUserStore(ApplicationDbContext context) : base(context)
        {
        }
    }

    public class ApplicationUserManager : UserManager<ApplicationUser, int>
    {
        public ApplicationUserManager(IUserStore<ApplicationUser, int> store, IIdentityMessageService emailService)
            : base(store)
        {
            this.EmailService = emailService;
        }

        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context)
        {
            var appDbContext = context.Get<ApplicationDbContext>();
            var appUserManager = new ApplicationUserManager(new ApplicationUserStore(context.Get<ApplicationDbContext>()), new EmailService());

            // Configure validation logic for usernames
            appUserManager.UserValidator = new UserValidator<ApplicationUser, int>(appUserManager)
            {
                AllowOnlyAlphanumericUserNames = true,
                RequireUniqueEmail = true
            };

            // Configure validation logic for passwords
            appUserManager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 6,
                RequireNonLetterOrDigit = true,
                RequireDigit = false,
                RequireLowercase = true,
                RequireUppercase = true,
            };

            //appUserManager.EmailService = new AspNetIdentity.WebApi.Services.EmailService();

            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                appUserManager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser, int>(dataProtectionProvider.Create("ASP.NET Identity"))
                {
                    //Code for email confirmation and reset password life time
                    TokenLifespan = TimeSpan.FromHours(6)
                };
            }

            return appUserManager;
        }



        public static ApplicationUser GetUser(int _userId)
        {
            return GetUser(new ApplicationDbContext(), _userId);
        }

        public static ApplicationUser GetUser(ApplicationDbContext db, int _userId)
        {
            ApplicationUser _retVal = null;
            _retVal = db.Users.Where(p => p.Id == _userId).Include(x => x.Roles)
                .Include(x => x.Roles.Select(r => r.Role.Permissions))
                .FirstOrDefault();
            return _retVal;
        }

        public static List<ApplicationUser> GetUsers()
        {
            List<ApplicationUser> _retVal = null;
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                _retVal = db.Users
                    .Include(x => x.Roles)
                    .Include(x => x.Roles.Select(y => y.Role))
                    .OrderBy(r => r.LastName).ThenBy(r => r.FirstName).ToList();
            }
            return _retVal;
        }

        public static List<ApplicationUser> GetUsers4Surname(string _surname)
        {
            List<ApplicationUser> _retVal = null;
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                _retVal = db.Users.Where(r => r.Inactive == false || r.Inactive == null & r.LastName == _surname)
                    .OrderBy(r => r.LastName).ThenBy(r => r.FirstName).ToList();
            }
            return _retVal;
        }

        public static bool AddUser2Role(int _userId, int _roleId)
        {
            bool _retVal = false;
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                ApplicationUser _user = GetUser(db, _userId);
                if (_user.Roles.All(p => p.RoleId != _roleId))
                {
                    //_user.UserRoles.Add(_role);

                    ApplicationUserRole _identityRole = new ApplicationUserRole { UserId = _userId, RoleId = _roleId };
                    if (!_user.Roles.Contains(_identityRole))
                        _user.Roles.Add(_identityRole);

                    _user.LastModified = DateTime.Now;
                    db.Entry(_user).State = EntityState.Modified;
                    db.SaveChanges();

                    _retVal = true;
                }
            }
            return _retVal;
        }

        public static bool RemoveUser4Role(int userId, int roleId)
        {
            bool _retVal = false;
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                ApplicationUser _user = GetUser(db, userId);
                if (_user.Roles.Any(p => p.RoleId == roleId))
                {
                    _user.Roles.Remove(_user.Roles.FirstOrDefault(p => p.RoleId == roleId));
                    _user.LastModified = DateTime.Now;
                    db.Entry(_user).State = EntityState.Modified;
                    db.SaveChanges();

                    _retVal = true;
                }
            }
            return _retVal;
        }

        public static bool RemoveAllUsers4Role(int roleId)
        {
            bool _retVal = false;
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                var users = db.Users.Where(x => x.Roles.Any(y => y.RoleId == roleId)).ToList();
                foreach (var user in users)
                {
                    user.Roles.Remove(user.Roles.FirstOrDefault(p => p.RoleId == roleId));
                    user.LastModified = DateTime.Now;
                    db.Entry(user).State = EntityState.Modified;

                }
                _retVal = true;
                db.SaveChanges();
            }
            return _retVal;
        }

        public static bool DeleteUser(int _userId)
        {
            bool retVal = false;
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                var user = GetUser(db, _userId);

                user.Roles.Clear();
                db.Entry(user).State = EntityState.Deleted;
                db.SaveChanges();

                retVal = true;
            }
            return retVal;
        }

        public static bool UpdateUser(UserViewModel _user)
        {
            bool _retVal = false;
            try
            {
                using (ApplicationDbContext db = new ApplicationDbContext())
                {
                    ApplicationUser _user2Modify = GetUser(db, _user.Id);

                    db.Entry(_user2Modify).Entity.UserName = _user.UserName;
                    db.Entry(_user2Modify).Entity.Email = _user.Email;
                    db.Entry(_user2Modify).Entity.FirstName = _user.Firstname;
                    db.Entry(_user2Modify).Entity.LastName = _user.Lastname;
                    db.Entry(_user2Modify).Entity.LastModified = System.DateTime.Now;
                    db.Entry(_user2Modify).Entity.ImagePath = _user.ImagePath;
                    db.Entry(_user2Modify).Entity.SupportedLanguage = _user.Language;
                    db.Entry(_user2Modify).Entity.Signature = _user.SignaturePath;
                    db.Entry(_user2Modify).State = EntityState.Modified;
                    db.SaveChanges();

                    _retVal = true;
                }
            }
            catch (Exception ex)
            {
                string x = ex.Message;
            }
            return _retVal;
        }


        public static List<ApplicationUser> GetUsers4SelectList()
        {
            List<ApplicationUser> _retVal = null;
            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                _retVal = db.Users.Where(r => r.Inactive == false).ToList();
            }
            return _retVal;
        }
    }
}