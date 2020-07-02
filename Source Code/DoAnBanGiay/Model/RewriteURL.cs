using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace Model
{
    public static class RewriteURL
    {
        public static string RewriteUrl(string unicode)
        {
            unicode = Regex.Replace(unicode, "[áàảãạăắằẳẵặâấầẩẫậ]", "a");
            unicode = Regex.Replace(unicode, "[óòỏõọôồốổỗộơớờởỡợ]", "o");
            unicode = Regex.Replace(unicode, "[éèẻẽẹêếềểễệ]", "e");
            unicode = Regex.Replace(unicode, "[Đ]", "D");
            unicode = Regex.Replace(unicode, "[ÂẤẪẬẨẦĂẮẰẶẴẲ]", "D");
            unicode = Regex.Replace(unicode, "[íìỉĩị]", "i");
            unicode = Regex.Replace(unicode, "[úùủũụưứừửữự]", "u");
            unicode = Regex.Replace(unicode, "[ýỳỷỹỵ]", "y");
            unicode = Regex.Replace(unicode, "[đ]", "d");
            unicode = Regex.Replace(unicode, "[ÒÓỎÕỌ]", "O");
            unicode = Regex.Replace(unicode, "[ÉÈẺẼẸÊỀẾỂỄỆ]", "E");
            unicode = Regex.Replace(unicode, "[ÍÌĨỈỊ]", "I");
            unicode = Regex.Replace(unicode, "[ÝỶỸỲỴ]", "Y");
            unicode = Regex.Replace(unicode, "\\W+", "-");
            return unicode;
        }
    }
}
