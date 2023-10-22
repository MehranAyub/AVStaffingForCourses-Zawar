using System.Web;
using System.Web.Optimization;

namespace AVStaffing
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include("~/Scripts/jquery-{version}.js"));
            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Scripts/jquery.validate.js",
                "~/Scripts/jquery.validate.unobtrusive.js"
            ));
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include("~/Scripts/modernizr-*"));
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include("~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css"));

            bundles.Add(new StyleBundle("~/bundles/webBaseLayoutCss")
                    //.Include("https://fonts.googleapis.com/css?family=Nunito:400,400i,600,700&amp;display=swap")
                .Include("~/plugins/tagsinput/bootstrap-tagsinput.css")
                .Include("~/Content/font-awesome.css")
                .Include("~/Theme/assets/vendors/general/select2/dist/css/select2.css")
                //.Include("https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.3.0/css/flag-icon.min.css")
            );


            bundles.Add(new ScriptBundle("~/bundles/webBaseLayoutJs")
                .Include("~/Frontend/assets/js/popper.min.js")
                .Include("~/Frontend/assets/js/bootstrap.js")
                .Include("~/Frontend/assets/js/aos.js")
                .Include("~/Frontend/assets/js/clipboard.min.js")
              
                //.Include("~/Frontend/assets/js/jquery.fancybox.min.js")
                //.Include("~/Frontend/assets/js/flatpickr.min.js")

                .Include("~/Frontend/assets/js/flickity.pkgd.min.js")

                //.Include("~/Frontend/assets/js/ion.rangeSlider.min.js")
                //.Include("~/Frontend/assets/js/isotope.pkgd.min.js")
                //.Include("~/Frontend/assets/js/jarallax.min.js")
                //.Include("~/Frontend/assets/js/jarallax-video.min.js")
                //.Include("~/Frontend/assets/js/jarallax-element.min.js")
                //.Include("~/Frontend/assets/js/jquery.countdown.min.js")
                //.Include("~/Frontend/assets/js/jquery.smartWizard.min.js")
                //.Include("~/Frontend/assets/js/plyr.polyfilled.min.js")
                //.Include("~/Frontend/assets/js/prism.js")
                //.Include("~/Frontend/assets/js/scrollMonitor.js")


                .Include("~/Frontend/assets/js/smooth-scroll.polyfills.min.js")
                .Include("~/Frontend/assets/js/svg-injector.umd.production.js")


                //.Include("~/Frontend/assets/js/twitterFetcher_min.js")


                .Include("~/Frontend/assets/js/typed.min.js")
                .Include("~/Frontend/assets/js/theme.js")


                .Include("~/plugins/tagsinput/bootstrap-tagsinput.js")


                .Include("~/Scripts/swal.js")
                .Include("~/Scripts/bootbox.js")
                .Include("~/Theme/assets/vendors/general/select2/dist/js/select2.full.min.js")
                .Include("~/Scripts/vue.min.js")
            );

            BundleTable.EnableOptimizations = true;
        }
    }
}

