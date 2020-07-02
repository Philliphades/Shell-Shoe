using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF;

namespace DoAnTotNghiepBanGiay.Models
{

        [Serializable]
        public class CartItem
        {
            public SANPHAM Product { get; set; }
            public int CoGiay { get; set; }
            public int Quantity { get; set; }
    }
}