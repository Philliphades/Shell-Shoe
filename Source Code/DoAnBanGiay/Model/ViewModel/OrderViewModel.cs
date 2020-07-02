using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class OrderViewModel
    {
        public long productID { get; set; }
        public string productName { get; set; }
        public string productMetatitle { get; set; }
        public int? productQuantity { get; set; }
        public int? productPrice { get; set; }
        public string productAvatar { get; set; }
        public int cogiay{ get; set; }
    }
}
