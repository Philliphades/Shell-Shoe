using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    public class QuanLyTaiKhoanController : BaseAdminController
    {
        //
        // GET: /Admin/QuanLyTaiKhoan/

        public ActionResult Index()
        {
            return View();
        }

    }
}
