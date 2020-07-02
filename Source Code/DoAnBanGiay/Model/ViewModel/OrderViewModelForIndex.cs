using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class OrderViewModelForIndex
    {
        public long orderID { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public int TotalQuantity { get; set; }
        public int TotalPrice { get; set; }
    }
}
