namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TAIKHOAN")]
    public partial class TAIKHOAN
    {
        public long ID { get; set; }

        [StringLength(50)]
        public string TenTaiKhoan { get; set; }

        [StringLength(32)]
        public string MatKhau { get; set; }

        [StringLength(50)]
        public string HoTen { get; set; }

        [StringLength(200)]
        public string DiaChi { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string SoDienThoai { get; set; }

        public int? QuyenHan { get; set; }

        public DateTime? NgayTao { get; set; }

        public int? TrangThai { get; set; }
    }
}
