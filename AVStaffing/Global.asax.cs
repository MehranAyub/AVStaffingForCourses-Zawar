using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Hangfire;
using Hangfire.SqlServer;
using Hangfire.Storage;
using AVStaffing.Infrastructure;
using AVStaffing.Models;
using System.Data.Entity;
using System.Web.Helpers;
using System.Web.Hosting;
using log4net.Repository.Hierarchy;
using AVStaffing.Models.Entities;

namespace AVStaffing
{
    public class ApplicationPreload : System.Web.Hosting.IProcessHostPreloadClient
    {
        public void Preload(string[] parameters)
        {
            HangfireBootstrapper.Instance.Start();
        }
    }

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

#if !DEBUG
            Database.SetInitializer<ApplicationDbContext>(null);
#endif

            HangfireBootstrapper.Instance.Start();
            AreaRegistration.RegisterAllAreas();
            var filters = GlobalFilters.Filters;
            filters.Add(new AuthorizeAttribute());
            FilterConfig.RegisterGlobalFilters(filters);
            HangfireAspNet.Use(GetHangfireServers);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            log4net.Config.XmlConfigurator.Configure();
            AntiForgeryConfig.SuppressIdentityHeuristicChecks = true;
            using (var dbContext = new ApplicationDbContext())
            {
                var permissions = dbContext.Permissions.ToList();
                foreach (var p in permissions)
                {
                    LoadedPermissions.Permissions.GetOrAdd($"{p.Controller}-{p.Action}", p);
                }

                var portfolios = dbContext.Portfolios
                    .Include(x => x.AboutUs)
                    .Include(x => x.TermsOfService)
                    .Include(x => x.Testimonials)
                    .Include(x => x.ContactUs)
                    .ToList();

                foreach (var p in portfolios)
                {
                    LoadedPermissions.Portfolios.GetOrAdd(p.Language, p);
                }
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {
            HangfireBootstrapper.Instance.Stop();
        }

      
        private IEnumerable<IDisposable> GetHangfireServers()
        {
            try
            {
                GlobalConfiguration.Configuration
                    .SetDataCompatibilityLevel(CompatibilityLevel.Version_170)
                    .UseSimpleAssemblyNameTypeSerializer()
                    .UseRecommendedSerializerSettings()
                    .UseSqlServerStorage(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString,
                        new SqlServerStorageOptions
                        {
                            CommandBatchMaxTimeout = TimeSpan.FromMinutes(5),
                            SlidingInvisibilityTimeout = TimeSpan.FromMinutes(5),
                            QueuePollInterval = TimeSpan.Zero,
                            UseRecommendedIsolationLevel = true,
                            UsePageLocksOnDequeue = true,
                            DisableGlobalLocks = true
                        });
            }
            catch (Exception ex)
            {
                throw;
            }
            yield return new BackgroundJobServer();
        }
    }

    public class HangfireBootstrapper : IRegisteredObject
    {
        public static readonly HangfireBootstrapper Instance = new HangfireBootstrapper();

        private readonly object _lockObject = new object();
        private bool _started;

        private BackgroundJobServer _backgroundJobServer;

        private HangfireBootstrapper()
        {
        }

        public void Start()
        {
            lock (_lockObject)
            {
                if (_started) return;
                _started = true;

                HostingEnvironment.RegisterObject(this);

                GlobalConfiguration.Configuration
                    .UseSqlServerStorage(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                // Specify other options here

                _backgroundJobServer = new BackgroundJobServer();
            }
        }

        public void Stop()
        {
            lock (_lockObject)
            {
                if (_backgroundJobServer != null)
                {
                    _backgroundJobServer.Dispose();
                }

                HostingEnvironment.UnregisterObject(this);
            }
        }

        void IRegisteredObject.Stop(bool immediate)
        {
            Stop();
        }
    }

}

