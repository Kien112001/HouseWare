using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace HouseWare
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Session_Start()
        {   //Lưu thông tin đăng nhập quản lý
            Session["UserAdmin"] = "";
            //Lưu mã người đăng nhập quản lý 
            Session["UserId"] = "";
            //giỏ hàng
            Session["MyCart"] = "";
            //lưu thông tin đăng nhập người dùng
            Session["UserCustomer"] = "";
            Session["CustomerId"] = "";
            Session["CustomerIdRole"] = "";


        }
    }
}
