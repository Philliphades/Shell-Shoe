namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MENU")]
    public partial class MENU
    {
        public long ID { get; set; }

        [StringLength(50)]
        public string Ten { get; set; }

        public int? IDCha { get; set; }

        [StringLength(200)]
        public string Link { get; set; }

        public DateTime? NgayTao { get; set; }

        [StringLength(50)]
        public string NguoiTao { get; set; }

        public int? TrangThai { get; set; }
    }
}
