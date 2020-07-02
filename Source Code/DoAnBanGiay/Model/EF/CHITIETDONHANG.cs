namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CHITIETDONHANG")]
    public partial class CHITIETDONHANG
    {
        public long ID { get; set; }

        public long? IDCo { get; set; }

        public long? IDDonHang { get; set; }

        public int? SoLuong { get; set; }

        public decimal? Gia { get; set; }
    }
}
