using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using DoAnTotNghiepBanGiay.Areas.Admin.Models;
using DoAnTotNghiepBanGiay.Common;


namespace DoAnTotNghiepBanGiay.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Index()
        {
            var sesU = (UserInfoPublic)Session[CommonConstant.USER_SESSION];
            if (sesU != null)
            {
                return RedirectToAction("Index", "HomeAdmin");
            }
            return View();
        }


        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new AccountDAO();
                int result = dao.loginAccount(model.username, Encryptor.MD5Hash(model.password));
                switch (result)
                {
                    //Đăng nhập quyền nhân viên (xem danh sách)
                    case 11:
                        {
                            var user = dao.GetByUserName(model.username);
                            var userSession = new UserInfoPublic();
                            userSession.Username = user.TenTaiKhoan;
                            userSession.UserID = user.ID;
                            userSession.Permision = user.QuyenHan;

                            UserInfo.UserID = user.ID;
                            UserInfo.Username = user.TenTaiKhoan;
                            UserInfo.Permision = user.QuyenHan;


                            Session.Add(Common.CommonConstant.USER_SESSION, userSession);
                            return RedirectToAction("Index", "HomeAdmin");
                            break;
                        }
                    //Đăng nhập quyền nhân viên (Thêm sửa xóa)
                    case 12:
                        {
                            var user = dao.GetByUserName(model.username);
                            var userSession = new UserInfoPublic();
                            userSession.Username = user.TenTaiKhoan;
                            userSession.UserID = user.ID;
                            userSession.Permision = user.QuyenHan;

                            UserInfo.UserID = user.ID;
                            UserInfo.Username = user.TenTaiKhoan;
                            UserInfo.Permision = user.QuyenHan;
                            Session.Add(Common.CommonConstant.USER_SESSION, userSession);
                            return RedirectToAction("Index", "HomeAdmin");
                            break;
                        }

                    case 0:
                        {
                            ModelState.AddModelError("", "Tài khoản không có quyền truy cập!");
                            break;
                        }



                    //Đăng nhập trường hợp tài khoản bị khóa
                    case -1:
                        {
                            ModelState.AddModelError("", "Tài khoản này đã bị khóa!");
                            break;

                        }

                    //Đăng nhập trường hợp sai mật khẩu
                    case -10:
                        {
                            ModelState.AddModelError("", "Mật khẩu không đúng!");
                            break;
                        }

                    //Đăng nhập trường hợp sai tên tài khoản
                    case -11:
                        {
                            ModelState.AddModelError("", "Tài khoản không tồn tại.");
                            break;
                        }
                }

            }
            return View("Index");
        }


        public ActionResult LogoutAdmin()
        {
            Session.Abandon();
            UserInfo.UserID = 0;
            UserInfo.Username = "";
            UserInfo.Permision = null;
            return RedirectToAction("Index", "Login");

        }

    }
}
