namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DANHMUCSANPHAM")]
    public partial class DANHMUCSANPHAM
    {
        public long ID { get; set; }

        [StringLength(50)]
        public string TenDanhMuc { get; set; }

        [StringLength(150)]
        public string Metatitle { get; set; }

        public int? IDCha { get; set; }

        public DateTime? NgayTao { get; set; }

        [StringLength(50)]
        public string NguoiTao { get; set; }

        public int? TrangThai { get; set; }
    }
}
