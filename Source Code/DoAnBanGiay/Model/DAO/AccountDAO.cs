using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;


namespace Model.DAO
{
    public class AccountDAO
    {

        DoanTNDataContext db = null;
        public AccountDAO()
        {
            db = new DoanTNDataContext();
        }

        static int giatrikiemtra = 0;



        /*TrangThai
         * -11 ---> TÀI KHOẢN K TỒN TẠI
         *-10 ---> Sai Mật khẩu
         *0   ---> CHỜ
         *-1  ---> KHÓA
         * 1  ---> Active
         * 
         * QuyenHan
         * 0 = Quyền nhân viên (view list)
         * 1 = QUyền nhân viên (add)
        */
        public int loginAccount(string username, string pass)
        {
            var result = db.TAIKHOANs.SingleOrDefault(x => x.TenTaiKhoan.ToUpper() == username.ToUpper());
            //KHông có tk
            if (result == null)
            {
                giatrikiemtra = -11;
            }
            else
            {
                //SAI Mật khẩu
                if (result != null && result.MatKhau != pass)
                {
                    giatrikiemtra = -10;
                }
                else
                {
                    //TK CHƯA CÓ QUYỀN TRUY CẬP (CHỜ)
                    if (result.TrangThai == 0)
                    {
                        giatrikiemtra = 0; //CHỜ
                    }

                    else
                    {
                        //TK bị KHÓA
                        if (result.TrangThai == (-1))
                        {
                            giatrikiemtra = -1;
                        }
                        else
                        //KIỂM TRA QUYỀN
                        {
                            //Quyền nhân viên
                            if (result.TrangThai == 1 && result.QuyenHan == 1)
                            {
                                giatrikiemtra = 11;
                            }
                            else
                            {

                                //Quyền admin
                                if (result.TrangThai == 1 && result.QuyenHan == 2)
                                {
                                    giatrikiemtra = 12;
                                }
                            }

                        }
                    }
                }
            }

            return giatrikiemtra;
        }


        public TAIKHOAN GetByUserName(string userName)
        {
            return db.TAIKHOANs.SingleOrDefault(u => u.TenTaiKhoan == userName);
        }


        public long addAccount(TAIKHOAN tk)
        {
            db.TAIKHOANs.Add(tk);
            db.SaveChanges();
            return tk.ID;
        }

    }
}
