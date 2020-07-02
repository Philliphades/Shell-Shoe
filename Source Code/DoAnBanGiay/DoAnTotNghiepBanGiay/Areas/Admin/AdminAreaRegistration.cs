using System.Web.Mvc;

namespace DoAnTotNghiepBanGiay.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );

            //Map cho trang xem trước thông tin sản phẩm
            context.MapRoute(
               name: "xem truoc",
               url: "Admin/{controller}/{action}/{id}",
               defaults: new { controller = "QuanLySanPham", action = "XemTruoc", id = UrlParameter.Optional }
           );


            context.MapRoute(
                "View detail Order",
                "Admin/chi-tiet-don-hang/{id}",
                new { controller = "QuanLyDonHang", action = "ViewDetail", id = UrlParameter.Optional }
            );
            context.MapRoute(
               "cập nhật sản phẩm",
               "Admin/QuanLySanPham/CapNhat/{id}",
               new { controller = "QuanLySanPham", action = "CapNhat", id = UrlParameter.Optional }
           );
            context.MapRoute(
               "Hoan thanh sản phẩm",
               "Admin/QuanLySanPham/HoanThanhDonHang/{id}",
               new { controller = "QuanLySanPham", action = "HoanThanhDonHang", id = UrlParameter.Optional }
           );

            

        }

    }
}
