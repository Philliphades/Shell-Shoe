using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using PagedList;


namespace DoAnTotNghiepBanGiay.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /SanPham/

        //public ActionResult Index(long id)
        //{
        //    SanPhamDAO pr = new SanPhamDAO();
        //    var model = pr.ChiTietByID(id);
        //    pr.ThemLuotView(id);
        //    //ViewBag.vb_relativeProduct = pr.relativeProduct(id);
        //    return View(model);
        //}



        [HttpGet]
        public ActionResult ChiTiet(long id)
        {
            SanPhamDAO pr = new SanPhamDAO();
            var model = pr.ChiTietByID(id);
            pr.ThemLuotView(id);
            ViewBag.vb_size = new CoDAO().ListSizeByIDProduct(id);
            ViewBag.vb_relative = new SanPhamDAO().SanPhamLienQuan(id);
            //ViewBag.vb_relativeProduct = pr.relativeProduct(id);
            return View(model);
        }

    }
}
