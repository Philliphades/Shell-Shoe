namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SLIDE")]
    public partial class SLIDE
    {
        public long ID { get; set; }

        [StringLength(100)]
        public string TenSlide { get; set; }

        [StringLength(100)]
        public string Metatitle { get; set; }

        [StringLength(500)]
        public string Anh { get; set; }

        [StringLength(150)]
        public string Link { get; set; }

        public DateTime? NgayTao { get; set; }

        public int? TrangThai { get; set; }
    }
}
