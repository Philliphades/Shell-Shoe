using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class ChiTietDonHangDAO
    {

        DoanTNDataContext db = null;
        public ChiTietDonHangDAO()
        {
            db = new DoanTNDataContext();
        }

        public void Add(CHITIETDONHANG od)
        {
            db.CHITIETDONHANGs.Add(od);
            db.SaveChanges();
        }

        public List<CHITIETDONHANG> GetListByIDOrder(long id)
        {
            return db.CHITIETDONHANGs.Where(x => x.IDDonHang == id).ToList();
        }

        public void TruSoLuongCoGiayDonHangXuat(long idco, int soluongmua)
        {
            COGIAY cs = db.COGIAYs.Find(idco);
            cs.SoLuong = cs.SoLuong - soluongmua;
            db.SaveChanges();
        }
        
        //Cộng lại số lượng cỡ giày đã được trả lại
        public void CongSoLuongCoGiayDonHangTra(long idco, int soluongmua)
        {
            COGIAY cs = db.COGIAYs.Find(idco);
            cs.SoLuong = cs.SoLuong + soluongmua;
            db.SaveChanges();
        }
    }
}
