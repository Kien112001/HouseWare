using HouseWare.Models;
using HouseWare.Models.Dao;
using HouseWare.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseWare.Controllers
{
    public class UserController : Controller
    {
        HouseWare_Context db = new HouseWare_Context();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Dangnhap()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Dangnhap(User login)
        {
             if (ModelState.IsValid)
            {
                var user = new UserDao();
                var result = user.login(login.UserName,Common.EncryptMD5( login.Password));
                if (result == 1)
                {
                    //ModelState.AddModelError("", "Đăng nhập thành công");
                    //Session.Add(Constants.USER_SESSION, login.UserName);

                    Session["UserCustomer"] = login.UserName;
                    Session["CustomerId"] = login.ID;
                    Session["CustomerIdRole"] = db.Users.Where(us => us.IdRole==login.IdRole);

                    return RedirectToAction("Index","HouseWare");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại");
                }
            }
            return View("Dangnhap");
        }
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Dangky(User user)
        {
            if (ModelState.IsValid)
            {
                var check = db.Users.FirstOrDefault(s => s.Phone == user.Phone);
                if (check == null)
                {
                    user.Password = Common.EncryptMD5(user.Password);
                    user.IdRole = 2;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Users.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Dangnhap", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Phone already exists");

                }

            }
            return View("Dangky"); 
        }
        public ActionResult Dangxuat()
        {
            Session["UserCustomer"] = "";
            Session["MyCart"] = "";
            //

         
            return RedirectToAction("Index", "HouseWare");
        }
    }
}