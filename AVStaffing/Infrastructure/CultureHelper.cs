using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.SessionState;
using AVStaffing.Models;
using AVStaffing.Models.Constants;

namespace AVStaffing.Infrastructure
{
    public class CultureHelper
    {
        protected HttpSessionState session;

        //constructor 
        public CultureHelper(HttpSessionState httpSessionState)
        {
            session = httpSessionState;
        }
        // Properties
        public static int CurrentCulture
        {
            get
            {
                switch (Thread.CurrentThread.CurrentUICulture.Name)
                {
                    case SupportedLanguages.English:
                        return 0;
                    case SupportedLanguages.Dutch:
                        return 1;
                    default:
                        return 0;
                }
            }
            set
            {
                switch (value)
                {
                    case 0:
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo(SupportedLanguages.English);
                        break;
                    case 1:
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo(SupportedLanguages.Dutch);
                        break;
                    default:
                        Thread.CurrentThread.CurrentUICulture = CultureInfo.InvariantCulture;
                        break;
                }

                Thread.CurrentThread.CurrentCulture = Thread.CurrentThread.CurrentUICulture;
            }
        }
    }
}