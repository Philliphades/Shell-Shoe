using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using DoAnTotNghiepBanGiay.Common;
using PagedList;


namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    public class QuanLySanPhamController : BaseAdminController
    {
        //
        // GET: /Admin/QuanLySanPham/

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult ThemSanPham()
        {
            GetCateGoryForCreateProduct();
            LayDanhSachHang();
            return View();
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemSanPham(SANPHAM sp, string cogiay_soluong)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (cogiay_soluong == "")
                    {
                        SetAlert("Thêm sản phẩm thất bại. Vui lòng nhập đủ trường dữ liệu!", "canhbao");
                    }
                    else
                    {
                        var DAO = new SanPhamDAO();
                        sp.Metatitle = RewriteURL.RewriteUrl(sp.TenSP);
                        sp.NguoiTao = UserInfo.UserID;
                        sp.NgayTao = DateTime.Now;
                        sp.TrangThai = 0;
                        sp.LuotXem = 0;
                        long idsp = DAO.Insert(sp);

                        //Lấy ra tất cả các cỡ+số lượng
                        string[] mangco = cogiay_soluong.Split(' ');

                        //Với mỗi cỡ và số lượng đó tách riêng cỡ và số lượng vào 1 mảng
                        for (int i = 0; i < mangco.Length; i++)
                        {
                            string[] mangs = mangco[i].Split(',');
                            int co = int.Parse(mangs[0].ToString());
                            int sl = int.Parse(mangs[1].ToString());

                            //Thêm cỡ mới vào bảng cỡ
                            CoDAO cDAO = new CoDAO();
                            COGIAY cogiay = new COGIAY();
                            cogiay.IDSP = idsp;
                            cogiay.SoLuong = sl;
                            cogiay.Co = co;
                            cDAO.ThemCo(cogiay);
                        }
                        SetAlert("Thêm sản phẩm thành công", "thanhcong");
                    }
                }

            }
            catch (Exception)
            {
                SetAlert("Thêm sản phẩm thất bại", "canhbao");
            }
            return RedirectToAction("ChoDuyet", "QuanLySanPham");
        }



        [HttpGet]
        public ActionResult CapNhat(long id)
        {
            var pr = new SanPhamDAO().ChiTietByID(id);
            ViewBag.vb_anhdaidien = pr.AnhDaiDien;
            GetCateGoryForCreateProduct();
            LayDanhSachHang();
            return View(pr);
        }



        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CapNhat(SANPHAM pr)
        {
      

            if (ModelState.IsValid)
            {
                var result = new SanPhamDAO().CapNhat(pr);

                if (result == true)
                {
                    SetAlert("Cập nhật thành công", "thanhcong");
                }
                else
                {
                    SetAlert("Cập nhật sản phẩm thất bại", "canhbao");
                }
            }
            return RedirectToAction("ChoDuyet", "QuanLySanPham");
        }






        [HttpGet]
        public ActionResult ChoDuyet(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new SanPhamDAO();
            var model = dao.DanhSachSPChoDuyet(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);
        }


        [HttpGet]
        public ActionResult XemTruoc(long id)
        {
            SanPhamDAO pr = new SanPhamDAO();
            var model = pr.ChiTietByID(id);
            pr.ThemLuotView(id);
            ViewBag.vb_size = new CoDAO().ListSizeByIDProduct(id);
            return View(model);
        }





        [HttpGet]
        public ActionResult DaDuyet(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new SanPhamDAO();
            var model = dao.DanhSachSPDaDuyet(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);

        }






        //Get LIST CATEGORY
        public void GetCateGoryForCreateProduct(long? selectedid = null)
        {
            var dao = new SanPhamDAO();
            ViewBag.IDDanhMuc = new SelectList(dao.ListCateGory(), "ID", "TenDanhMuc", selectedid);
        }
        public void LayDanhSachHang(long? selectedid = null)
        {
            var dao = new SanPhamDAO();
            ViewBag.IDHang = new SelectList(dao.ListHang(), "ID", "TenHang", selectedid);
        }



        //Duyệt và bỏ duyệt bản ghi
        [HttpPost]
        public ActionResult Duyet(long id)
        {
            SanPhamDAO dao = new SanPhamDAO();
            dao.UpdateTrangThai(id);
            return View();
        }
        [HttpPost]
        public ActionResult BoDuyet(long id)
        {
            SanPhamDAO dao = new SanPhamDAO();
            dao.UpdateTrangThai(id);
            return View();
        }
         [HttpPost]
        public ActionResult Khoa(long id)
        {
            SanPhamDAO dao = new SanPhamDAO();
            dao.UpdateTrangThai(id);
            return View();
        }
        


    }
}
