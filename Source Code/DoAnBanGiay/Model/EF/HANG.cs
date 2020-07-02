namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HANG")]
    public partial class HANG
    {
        public long ID { get; set; }

        [StringLength(50)]
        public string TenHang { get; set; }

        [Column(TypeName = "ntext")]
        public string ThongTinHang { get; set; }

        public int? TrangThai { get; set; }
    }
}
