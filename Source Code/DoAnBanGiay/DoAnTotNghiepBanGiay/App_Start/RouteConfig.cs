using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DoAnTotNghiepBanGiay
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            //Map cho trang thông tin sản phẩm
            routes.MapRoute(
               name: "thong tin san pham",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "SanPham", action = "ChiTiet", id = UrlParameter.Optional }
           );

            //Map cho trang danh mục sản phẩm
            routes.MapRoute(
               name: "Danh muc",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "DanhMuc", action = "Index", id = UrlParameter.Optional }
           );


        }
    }
}