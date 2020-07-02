using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using PagedList;

namespace DoAnTotNghiepBanGiay.Controllers
{
    public class DanhMucController : Controller
    {
        //
        // GET: /DanhMuc/

        public ActionResult Index( long id, int page=1, int pagesize=6)
        {
            var model = new SanPhamDAO().DanhSachSanPhamTheoDanhMuc(id, page, pagesize);
            var sp = new DanhMucSanPhamDAO().FindByID(id);
            ViewBag.vbtendanhmuc = sp.TenDanhMuc;
            return View(model);
        }

    }
}
