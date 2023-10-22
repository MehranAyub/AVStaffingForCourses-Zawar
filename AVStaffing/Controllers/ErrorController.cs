using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AVStaffing.Controllers
{
    [AllowAnonymous]
    public class ErrorController : BaseController
    {
        // GET: Error
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult UnAuthorized()
        {
            return View();
        }

    }
}