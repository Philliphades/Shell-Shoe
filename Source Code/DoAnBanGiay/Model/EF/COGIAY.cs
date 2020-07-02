namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("COGIAY")]
    public partial class COGIAY
    {
        public long ID { get; set; }

        public long? IDSP { get; set; }

        public int? Co { get; set; }

        public int? SoLuong { get; set; }
    }
}
