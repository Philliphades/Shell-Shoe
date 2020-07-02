using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiepBanGiay
{
    [Serializable]
     public static class UserInfo
    {
        public static  long UserID { set; get; }
        public static string Username { set; get; }
        public static int? Permision { set; get; }
    }
}