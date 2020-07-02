using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class SanPhamDAO
    {

        DoanTNDataContext db = null;
        public SanPhamDAO()
        {
            db = new DoanTNDataContext();
        }



        //Danh sách sản phẩm chờ duyệt
        public IEnumerable<SANPHAM> DanhSachSPChoDuyet(string searchString, int page, int pageSize)
        {
            IQueryable<SANPHAM> model = db.SANPHAMs.Where(x => x.TrangThai == 0);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenSP.Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        //Danh sách sản phẩm chờ duyệt
        public IEnumerable<SANPHAM> DanhSachSPDaDuyet(string searchString, int page, int pageSize)
        {
            IQueryable<SANPHAM> model = db.SANPHAMs.Where(x => x.TrangThai == 2);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenSP.Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        // cap nhat thong tin san pham
        public bool CapNhat(SANPHAM pr)
        {

            try
            {
                var sp = db.SANPHAMs.Find(pr.ID);
                sp.TenSP = pr.TenSP;
                sp.Gia = pr.Gia;
                sp.GiaKhuyenMai = pr.GiaKhuyenMai;
                sp.NgaySuaDoi = DateTime.Now;
                sp.MoTaSP = pr.MoTaSP;
                sp.Code = pr.Code;
                sp.IDDanhMuc = pr.IDDanhMuc;
                sp.AnhDaiDien = pr.AnhDaiDien;
                sp.ChiTietSP = pr.ChiTietSP;
                sp.BaoHanh = pr.BaoHanh;
                sp.IDHang = pr.IDHang;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }





        //Thay đổi trạng thái sản phẩm (QUẢN TRỊ)
        public void UpdateTrangThai(long id)
        {
            var pr1 = db.SANPHAMs.SingleOrDefault(x => x.ID == id);
            if (pr1.TrangThai == 2)
            {
                pr1.TrangThai = 0;
            }
            else
                if (pr1.TrangThai == 0)
                {
                    pr1.TrangThai = 2;
                }
            db.SaveChanges();
        }

        public void KhoaSP(long id)
        {
            var pr1 = db.SANPHAMs.SingleOrDefault(x => x.ID == id);
            pr1.TrangThai = -1;
            db.SaveChanges();
        }



        //Tăng lượt xem của sản phẩm
        public void ThemLuotView(long id)
        {
            SANPHAM pr = db.SANPHAMs.Find(id);
            pr.LuotXem = pr.LuotXem + 1;
            db.SaveChanges();
        }

        public List<SANPHAM> GetInfoProductByID(long id)
        {
            return db.SANPHAMs.Where(x => x.ID == id).ToList();
        }


        //Lấy thông tin sản phẩm thoogn qua ID cỡ
        public SANPHAM getInfoByIDCo(long idco)
        {
            COGIAY cs = db.COGIAYs.Find(idco);
            SANPHAM sp = db.SANPHAMs.Where(x => x.ID == cs.IDSP).First();
            return sp;
        }



        //Lấy thông tin sản phẩm bằng mã sản phẩm
        public SANPHAM ChiTietByID(long? id)
        {
            return db.SANPHAMs.Find(id);
        }

        //-----Lấy ra danh mục sản phẩm (QUẢN TRỊ - Thêm sản phẩm)

        public List<DANHMUCSANPHAM> ListCateGory()
        {
            List<DANHMUCSANPHAM> lpr = null;
            lpr = db.DANHMUCSANPHAMs.Where(x => x.TrangThai == 2 && x.IDCha != 0).OrderBy(x => x.ID).ToList();
            foreach (var item in lpr)
            {
                item.TenDanhMuc = item.TenDanhMuc.ToUpper();
            }
            return lpr;
        }


        //-----Lấy ra danh mục sản phẩm (QUẢN TRỊ - Thêm sản phẩm)
        public List<HANG> ListHang()
        {
            List<HANG> lpr = null;
            lpr = db.HANGs.Where(x => x.TrangThai == 2).OrderBy(x => x.ID).ToList();
            foreach (var item in lpr)
            {
                item.TenHang = item.TenHang.ToUpper();
            }
            return lpr;
        }

        //Danh sách sản phẩm mới
        public List<SANPHAM> DanhSachSanPhamMoi()
        {
            return db.SANPHAMs.Where(x => x.TrangThai == 2).OrderByDescending(x => x.ID).Take(6).ToList();
        }

        public IEnumerable<SANPHAM> DanhSachTatCaSanPhamMoi(int page, int pageSize)
        {
            IEnumerable<SANPHAM> model = db.SANPHAMs.Where(x => x.TrangThai == 2).OrderByDescending(x => x.ID).ToList();
            return model.ToPagedList(page, pageSize);
        }




        //DANH SÁCH SẢN PHẨM ĐANG KHUYẾN MẠI
        public List<SANPHAM> DanhSachSanPhamKhuyenMai()
        {
            return db.SANPHAMs.Where(x => x.TrangThai == 2 && x.GiaKhuyenMai > 0).OrderByDescending(x => x.ID).Take(6).ToList();
        }

        public IEnumerable<SANPHAM> DanhSachTatCaSanPhamKhuyenMai(int page, int pageSize)
        {
            IEnumerable<SANPHAM> model = db.SANPHAMs.Where(x => x.TrangThai == 2 && x.GiaKhuyenMai > 0).OrderByDescending(x => x.ID).ToList();
            return model.ToPagedList(page, pageSize);
        }


        //SẢN PHẨM LIÊN QUAN (10 sản phẩm cùng DANH MỤC)
        public List<SANPHAM> SanPhamLienQuan(long id)
        {
            SANPHAM sp = db.SANPHAMs.Find(id);
            List<SANPHAM> ls = db.SANPHAMs.Where(x => x.TrangThai == 2 && x.ID != id && (x.IDDanhMuc == sp.IDDanhMuc)).ToList();
            return ls;
        }

        //LẤY SẢN PHẨM THEO DANH MỤC
        public IEnumerable<SANPHAM> DanhSachSanPhamTheoDanhMuc(long id, int page, int pageSize)
        {
            IEnumerable<SANPHAM> model = db.SANPHAMs.Where(x => x.TrangThai == 2 && x.IDDanhMuc == id).OrderByDescending(x => x.ID).ToList();
            return model.ToPagedList(page, pageSize);
        }

        //SẢN PHẨM NỔI BẬT
        public List<SANPHAM> SanPhamNoiBat()
        {
            return db.SANPHAMs.Where(x => x.TrangThai == 2).OrderByDescending(x => x.LuotXem).Take(5).ToList();
        }



        //THêm sản phẩm
        public long Insert(SANPHAM pr)
        {
            db.SANPHAMs.Add(pr);
            db.SaveChanges();
            return pr.ID;
        }

    }
}
