using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;


namespace Model.DAO
{
    public class CoDAO
    {

        DoanTNDataContext db = null;
        public CoDAO()
        {
            db = new DoanTNDataContext();
        }


        public COGIAY ViewByID(long id)
        {
            return db.COGIAYs.Find(id);
        }

        public long ThemCo(COGIAY cs)
        {
            db.COGIAYs.Add(cs);
            db.SaveChanges();
            return cs.ID;
        }

        public long LayIDCoGiayTheoIDSPVaCo(long idsp, int co)
        {
            return db.COGIAYs.Where(x => x.IDSP == idsp && x.Co == co).First().ID;
        }




        public List<COGIAY> ListSizeByIDProduct(long id)
        {
            return db.COGIAYs.Where(x => x.IDSP == id && x.SoLuong > 0).ToList();
        }

    }
}
