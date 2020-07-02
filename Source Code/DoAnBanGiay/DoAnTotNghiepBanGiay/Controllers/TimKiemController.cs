using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using DoAnTotNghiepBanGiay.Common;

namespace DoAnTotNghiepBanGiay.Controllers
{
    public class TimKiemController : Controller
    {
        //
        // GET: /TimKiem/

        public ActionResult Index(string keyword, int page=1, int pagesize=6)
        {
            ViewBag.vbtk = keyword;
            var model = new TimKiemDAO().timkiem(keyword, page, pagesize);
            return View(model);
        }

    }
}
