namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DONHANG")]
    public partial class DONHANG
    {
        public long ID { get; set; }

        public DateTime? NgayTao { get; set; }

        [StringLength(100)]
        public string TenKhachHang { get; set; }

        [StringLength(50)]
        public string DienThoaiKhachHang { get; set; }

        [StringLength(200)]
        public string DiaChiKhachHang { get; set; }

        [StringLength(50)]
        public string EmailKhachHang { get; set; }

        public int? TrangThai { get; set; }
    }
}
