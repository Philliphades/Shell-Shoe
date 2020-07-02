using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class DanhMucSanPhamDAO
    {
        DoanTNDataContext db = null;
        public DanhMucSanPhamDAO()
        {
            db = new DoanTNDataContext();
        }


        //Danh sách danh mục đã duyệt
        public IEnumerable<DANHMUCSANPHAM> ListAll(string searchString, int page, int pageSize)
        {
            IQueryable<DANHMUCSANPHAM> model = db.DANHMUCSANPHAMs.Where(x => x.TrangThai == 2);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenDanhMuc.Contains(searchString)||x.IDCha.ToString().Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        //Danh sách danh mục chờ duyệt
        public IEnumerable<DANHMUCSANPHAM> ChoDuyet(string searchString, int page, int pageSize)
        {
            IQueryable<DANHMUCSANPHAM> model = db.DANHMUCSANPHAMs.Where(x => x.TrangThai == 0);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenDanhMuc.Contains(searchString)||x.IDCha.ToString().Contains(searchString));
            }
            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        




        public List<DANHMUCSANPHAM> DanhMucSanPhamCha()
        {
            return db.DANHMUCSANPHAMs.Where(x => x.TrangThai == 2 && x.IDCha == 0).OrderBy(x => x.ID).ToList();
        }

        public List<DANHMUCSANPHAM> DanhMucSanPhamCon(long id)
        {
            return db.DANHMUCSANPHAMs.Where(x => x.TrangThai == 2 && x.IDCha == id).OrderBy(x => new {x.ID }).ToList();
        }

        public DANHMUCSANPHAM FindByID(long id)
        {
            return db.DANHMUCSANPHAMs.Find(id);
        }


        public void ThemDanhMuc(DANHMUCSANPHAM ds)
        {
            db.DANHMUCSANPHAMs.Add(ds);
            db.SaveChanges();
        }

    }
}
