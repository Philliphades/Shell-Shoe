namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SANPHAM")]
    public partial class SANPHAM
    {
        public long ID { get; set; }

        [StringLength(100)]
        public string TenSP { get; set; }

        [StringLength(30)]
        public string Code { get; set; }

        [StringLength(150)]
        public string Metatitle { get; set; }

        [StringLength(500)]
        public string MoTaSP { get; set; }

        [StringLength(500)]
        public string AnhDaiDien { get; set; }

        public decimal? Gia { get; set; }

        public decimal? GiaKhuyenMai { get; set; }

        [Column(TypeName = "ntext")]
        public string ChiTietSP { get; set; }

        public int? BaoHanh { get; set; }

        public DateTime? NgayTao { get; set; }

        public DateTime? NgaySuaDoi { get; set; }

        public int? LuotXem { get; set; }

        public int? TrangThai { get; set; }

        public long? IDDanhMuc { get; set; }

        public long? NguoiTao { get; set; }

        public long? IDHang { get; set; }
    }
}
