using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using Model.ViewModel;


namespace Model.DAO
{
    public class DonHangDAO
    {
        DoanTNDataContext db = null;

        public DonHangDAO()
        {
            db = new DoanTNDataContext();
        }

        public long Insert(DONHANG xx)
        {
            db.DONHANGs.Add(xx);
            db.SaveChanges();
            return xx.ID;
        }


        //Đơn hàng mới
        public IEnumerable<OrderViewModelForIndex> ListAllWait(string searchString, int page, int pageSize)
        {
            IQueryable<DONHANG> model = db.DONHANGs.Where(x => x.TrangThai == 0);
            List<OrderViewModelForIndex> listodvm = new List<OrderViewModelForIndex>();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenKhachHang.Contains(searchString) || x.DiaChiKhachHang.Contains(searchString));
            }

            foreach (var item in model)
            {
                int soluongsanpham = 0;
                int tongtien = 0;
                List<CHITIETDONHANG> lsod = new ChiTietDonHangDAO().GetListByIDOrder(item.ID);
                OrderViewModelForIndex xx = new OrderViewModelForIndex();

                //Lấy tổng tiền đơn hàng và tổng số sản phẩm
                foreach (var item1 in lsod)
                {
                    soluongsanpham = soluongsanpham + int.Parse(item1.SoLuong.ToString());
                    tongtien = tongtien + int.Parse(item1.Gia.ToString());
                }
                xx.CustomerName = item.TenKhachHang;
                xx.orderID = item.ID;
                xx.TotalPrice = tongtien;
                xx.TotalQuantity = soluongsanpham;
                xx.CustomerAddress = item.DiaChiKhachHang;
                listodvm.Add(xx);
            }
            return listodvm.OrderByDescending(x => x.orderID).ToPagedList(page, pageSize);
            //return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        //Đơn hagnf đã xuất
        public IEnumerable<OrderViewModelForIndex> DonHangDaXuat(string searchString, int page, int pageSize)
        {
            IQueryable<DONHANG> model = db.DONHANGs.Where(x => x.TrangThai == 1);
            List<OrderViewModelForIndex> listodvm = new List<OrderViewModelForIndex>();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenKhachHang.Contains(searchString) || x.DiaChiKhachHang.Contains(searchString));
            }

            foreach (var item in model)
            {
                int soluongsanpham = 0;
                int tongtien = 0;
                List<CHITIETDONHANG> lsod = new ChiTietDonHangDAO().GetListByIDOrder(item.ID);
                OrderViewModelForIndex xx = new OrderViewModelForIndex();

                //Lấy tổng tiền đơn hàng và tổng số sản phẩm
                foreach (var item1 in lsod)
                {
                    soluongsanpham = soluongsanpham + int.Parse(item1.SoLuong.ToString());
                    tongtien = tongtien + int.Parse(item1.Gia.ToString());
                }
                xx.CustomerName = item.TenKhachHang;
                xx.orderID = item.ID;
                xx.TotalPrice = tongtien;
                xx.TotalQuantity = soluongsanpham;
                xx.CustomerAddress = item.DiaChiKhachHang;
                listodvm.Add(xx);
            }
            return listodvm.OrderByDescending(x => x.orderID).ToPagedList(page, pageSize);
            //return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }


        //Đơn hàng  hoàn thành
        public IEnumerable<OrderViewModelForIndex> DonHangHoanThanh(string searchString, int page, int pageSize)
        {
            IQueryable<DONHANG> model = db.DONHANGs.Where(x => x.TrangThai == 2);
            List<OrderViewModelForIndex> listodvm = new List<OrderViewModelForIndex>();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenKhachHang.Contains(searchString) || x.DiaChiKhachHang.Contains(searchString));
            }

            foreach (var item in model)
            {
                int soluongsanpham = 0;
                int tongtien = 0;
                List<CHITIETDONHANG> lsod = new ChiTietDonHangDAO().GetListByIDOrder(item.ID);
                OrderViewModelForIndex xx = new OrderViewModelForIndex();

                //Lấy tổng tiền đơn hàng và tổng số sản phẩm
                foreach (var item1 in lsod)
                {
                    soluongsanpham = soluongsanpham + int.Parse(item1.SoLuong.ToString());
                    tongtien = tongtien + int.Parse(item1.Gia.ToString());
                }
                xx.CustomerName = item.TenKhachHang;
                xx.orderID = item.ID;
                xx.TotalPrice = tongtien;
                xx.TotalQuantity = soluongsanpham;
                xx.CustomerAddress = item.DiaChiKhachHang;
                listodvm.Add(xx);
            }
            return listodvm.OrderByDescending(x => x.orderID).ToPagedList(page, pageSize);
            //return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        //Đơn hàng đã hủy
        public IEnumerable<OrderViewModelForIndex> DonHangDaHuy(string searchString, int page, int pageSize)
        {
            IQueryable<DONHANG> model = db.DONHANGs.Where(x => x.TrangThai == -1);
            List<OrderViewModelForIndex> listodvm = new List<OrderViewModelForIndex>();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenKhachHang.Contains(searchString) || x.DiaChiKhachHang.Contains(searchString));
            }

            foreach (var item in model)
            {
                int soluongsanpham = 0;
                int tongtien = 0;
                List<CHITIETDONHANG> lsod = new ChiTietDonHangDAO().GetListByIDOrder(item.ID);
                OrderViewModelForIndex xx = new OrderViewModelForIndex();

                //Lấy tổng tiền đơn hàng và tổng số sản phẩm
                foreach (var item1 in lsod)
                {
                    soluongsanpham = soluongsanpham + int.Parse(item1.SoLuong.ToString());
                    tongtien = tongtien + int.Parse(item1.Gia.ToString());
                }
                xx.CustomerName = item.TenKhachHang;
                xx.orderID = item.ID;
                xx.TotalPrice = tongtien;
                xx.TotalQuantity = soluongsanpham;
                xx.CustomerAddress = item.DiaChiKhachHang;
                listodvm.Add(xx);
            }
            return listodvm.OrderByDescending(x => x.orderID).ToPagedList(page, pageSize);
            //return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }


        public DONHANG ViewByID(long id)
        {
            return db.DONHANGs.Find(id);
        }


        public void XuatDongHang(long id)
        {
            var donhang = db.DONHANGs.Find(id);
            donhang.TrangThai = 1;
            db.SaveChanges();
        }

        public void TraDongHang(long id)
        {
            var donhang = db.DONHANGs.Find(id);
            donhang.TrangThai = 0;
            db.SaveChanges();
        }

        public void HoanThanhDongHang(long id)
        {
            var donhang = db.DONHANGs.Find(id);
            donhang.TrangThai = 2;
            db.SaveChanges();
        }

        public void HuyDonHang(long id)
        {
            var donhang = db.DONHANGs.Find(id);
            donhang.TrangThai = -1;
            db.SaveChanges();
        }

    }
}
