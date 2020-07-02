using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using DoAnTotNghiepBanGiay.Common;
using PagedList;
using Model.ViewModel;

namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    public class QuanLyDonHangController : BaseAdminController
    {
        //
        // GET: /Admin/QuanLyDonHang/

        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new DonHangDAO();
            var model = dao.ListAllWait(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        //Đơn hàng đã xuất
        public ActionResult DonHangDaXuat(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new DonHangDAO();
            var model = dao.DonHangDaXuat(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        //Đơn hàng đã hoàn thành

        public ActionResult DonHangHoanThanh(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new DonHangDAO();
            var model = dao.DonHangHoanThanh(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);
        }

        public ActionResult DonHangDaHuy(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new DonHangDAO();
            var model = dao.DonHangDaHuy(searchString, page, pageSize);
            ViewBag.searchstring = searchString;
            return View(model);
        }




        public ActionResult ChiTiet(long id)
        {
            var dao = new ChiTietDonHangDAO();
            var dao1 = new DonHangDAO();
            int? tongtien = 0;
            //Lấy danh sách chi tiết đơn hàng trong chi tiết theo ID của đơn hàng
            var listOrder = dao.GetListByIDOrder(id);
            //Lấy ra thông tin khách hàng
            ViewBag.vbcs = dao1.ViewByID(id);


            //lấy danh sách sản phẩm trong đơn hàng đó
            List<OrderViewModel> lpr = new List<OrderViewModel>();
            foreach (var item in listOrder)
            {
                var od = new OrderViewModel();
                var pr = new SanPhamDAO().getInfoByIDCo(long.Parse(item.IDCo.ToString()));

                //LẤy cỡ giày của bản ghi theo ID cỡ
                string cogiayxxx = new CoDAO().ViewByID(long.Parse(item.IDCo.ToString())).Co.ToString();
                od.productAvatar = pr.AnhDaiDien;
                od.productID = pr.ID;
                od.productMetatitle = pr.Metatitle;
                od.productName = pr.TenSP;
                od.cogiay = int.Parse(cogiayxxx);
                od.productPrice = int.Parse(item.Gia.Value.ToString()) / item.SoLuong;
                od.productQuantity = item.SoLuong;
                tongtien = int.Parse(item.Gia.Value.ToString());
                lpr.Add(od);
            }
            ViewBag.vb_tongtien = tongtien;

            return View(lpr);
        }



        //Xuất đơn hàng đi (Trừ số lượng)
        [HttpPost]
        public ActionResult XuatDonHang(long id)
        {

            var dao = new DonHangDAO();
            var dao1 = new ChiTietDonHangDAO();
            //Thay đổi trạng thái đơn hàng thành 1 - Xuất đơn hàng
            dao.XuatDongHang(id);
            //Trừ số lượng các sản phẩm trong đơn hàng được xuất

            //Lấy danh sách chi tiết đơn hàng trong chi tiết theo ID của đơn hàng
            var listOrder = dao1.GetListByIDOrder(id);

            //Với mỗi chi tiết đơn hàng, trừ số lượng bảng cỡ theo ID SP và cỡ            
            foreach (var item in listOrder)
            {
                var xdao = new ChiTietDonHangDAO();
                xdao.TruSoLuongCoGiayDonHangXuat(long.Parse(item.IDCo.ToString()), int.Parse(item.SoLuong.ToString()));
            }

            return RedirectToAction("DonHangDaXuat", "QuanLyDonHang");
        }

        //Xuất đơn hàng đi
        [HttpPost]
        public ActionResult TraDonHang(long id)
        {

            var dao = new DonHangDAO();
            var dao1 = new ChiTietDonHangDAO();
            //Thay đổi trạng thái đơn hàng thành 0 - Đơn hàng chờ
            dao.TraDongHang(id);
            //Trừ số lượng các sản phẩm trong đơn hàng được xuất

            //Lấy danh sách chi tiết đơn hàng trong chi tiết theo ID của đơn hàng
            var listOrder = dao1.GetListByIDOrder(id);

            //Với mỗi chi tiết đơn hàng, cộng số lượng bảng cỡ theo ID SP và cỡ            
            foreach (var item in listOrder)
            {
                var xdao = new ChiTietDonHangDAO();
                xdao.CongSoLuongCoGiayDonHangTra(long.Parse(item.IDCo.ToString()), int.Parse(item.SoLuong.ToString()));
            }

            return RedirectToAction("Index", "QuanLyDonHang");
        }




        //Chuyển đơn hàng thành trạng thái hoàn thành (Có trạng thái là 2)
        [HttpPost]
        public ActionResult HoanThanhDonHang(long id)
        {
            var dao = new DonHangDAO();
            dao.HoanThanhDongHang(id);
            return RedirectToAction("DonHangHoanThanh", "QuanLyDonHang");
        }


        //CHuyển đơn hàng trạng thái thành Hủy(Trạng thái là -1)

        [HttpPost]
        public ActionResult HuyDonHang(long id)
        {
            var dao = new DonHangDAO();
            dao.HuyDonHang(id);
            return RedirectToAction("DonHangDaHuy", "QuanLyDonHang");
        }

    }
}
