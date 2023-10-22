using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using AVStaffing.LocalResource;
using AVStaffing.LocalResource.Account;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;

namespace AVStaffing.Models.ViewModels
{
    public class IndexViewModel
    {
        public bool HasPassword { get; set; }
        public IList<UserLoginInfo> Logins { get; set; }
        public string PhoneNumber { get; set; }
        public bool TwoFactor { get; set; }
        public bool BrowserRemembered { get; set; }
    }

    public class ManageLoginsViewModel
    {
        public IList<UserLoginInfo> CurrentLogins { get; set; }
        public IList<AuthenticationDescription> OtherLogins { get; set; }
    }

    public class FactorViewModel
    {
        public string Purpose { get; set; }
    }

    public class SetPasswordViewModel
    {
        [Required(ErrorMessageResourceType = typeof(Resource), ErrorMessageResourceName = nameof(Resource.NewPasswordRequiredError))]
        [StringLength(100,ErrorMessageResourceType  = typeof(Resource), ErrorMessageResourceName = nameof(Resource.NewPasswordStringLengthError) , MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(Resource), Name = nameof(Resource.NewPasswordStringLengthError))]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(Resource), Name = nameof(Resource.ConfirmPasswordDisplayName))]
        [Compare("NewPassword", ErrorMessageResourceType = typeof(Resource), ErrorMessageResourceName = nameof(Resource.ConfirmPasswordCompareError))]
        public string ConfirmPassword { get; set; }
    }

    public class ChangePasswordViewModel
    {
        [Required(ErrorMessageResourceType = typeof(ChangePassword), ErrorMessageResourceName = nameof(ChangePassword.CurrentPasswordRequiredError))]
        [DataType(DataType.Password)]
        [Display(ResourceType  = typeof(ChangePassword), Name = nameof(ChangePassword.CurrentPasswordDisplayName))]
        public string OldPassword { get; set; }

        [Required(ErrorMessageResourceType = typeof(ChangePassword), ErrorMessageResourceName = nameof(ChangePassword.NewPasswordRequiredError))]
        [StringLength(100, ErrorMessageResourceType = typeof(ChangePassword), ErrorMessageResourceName  = nameof(ChangePassword.NewPasswordStringLengthError) ,MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(ChangePassword), Name =  nameof(ChangePassword.NewPasswordDisplayName) )]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(ChangePassword) ,Name = nameof(ChangePassword.ConfirmPasswordDisplayName))]
        [Compare("NewPassword", ErrorMessageResourceType = typeof(ChangePassword), ErrorMessageResourceName = nameof(ChangePassword.ConfirmPasswordCompareError))]
        public string ConfirmPassword { get; set; }
    }

    public class AddPhoneNumberViewModel
    {
        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string Number { get; set; }
    }

    public class VerifyPhoneNumberViewModel
    {
        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }

        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
    }

    public class ConfigureTwoFactorViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
    }
}