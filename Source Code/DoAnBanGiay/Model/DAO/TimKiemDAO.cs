using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;


namespace Model.DAO
{
    public class TimKiemDAO
    {
        DoanTNDataContext db = null;
        public TimKiemDAO()
        {
            db = new DoanTNDataContext();
        }

        public IEnumerable<SANPHAM> timkiem(string sr, int page, int pagesize)
        {
            string titlekey = RewriteURL.RewriteUrl(sr).ToUpper();
            try
            {
                decimal pricekey = decimal.Parse(sr);
                IEnumerable<SANPHAM> model = db.SANPHAMs.Where(x => x.Gia <= pricekey && x.TrangThai == 2).OrderByDescending(x => x.Gia).ToList();
                return model.ToPagedList(page, pagesize);
            }
            catch (Exception)
            {
                IEnumerable<SANPHAM> model = db.SANPHAMs.Where(x => x.TenSP.ToUpper().Contains(sr.ToUpper()) || x.Metatitle.ToUpper().Contains(titlekey) || x.Code.Contains(sr) && x.TrangThai == 2).ToList();
                return model.ToPagedList(page, pagesize);
            }

        }
    }
}
