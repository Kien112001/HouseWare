using HouseWare.Models.Dao;
using HouseWare.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseWare.Controllers
{
    public class CartController : Controller
    {
        HouseWare_Context db = new HouseWare_Context();
        UserDao userDAO = new UserDao();
        // GET: Cart
        public ActionResult Index()
        {
            try
            {
                List<CartItem> listcart = (List<CartItem>)Session["MyCart"];
                return View("Index", listcart);
            }
            catch
            {
                return View();
            }
           
        }

        public ActionResult CartAdd(int productid)
        {
            Product product = db.Products.Find(productid);
            CartItem cartitem = new CartItem(product.ID, product.Name, product.Img, product.Gia, 1);
            if (Session["MyCart"].Equals(""))
            {
                //giỏ hàng chưa có hàng
                List<CartItem> listcart = new List<CartItem>();
                listcart.Add(cartitem);
                Session["MyCart"] = listcart;
            }
            else
            {
                //giỏ hàng  có hàng
                List<CartItem> listcart = (List<CartItem>) Session["MyCart"];
                //kiểm tra pro_id có trong danh sách chưa
                if(listcart.Where(m=>m.C_ProductID == productid).Count() != 0)
                {
                    int vt = 0;
                    cartitem.C_Qty += 1;
                    foreach(var item in listcart)
                    {
                        if(item.C_ProductID == productid)
                        {
                            listcart[vt].C_Qty += 1;
                            listcart[vt].C_Amount = (listcart[vt].C_Qty * listcart[vt].C_Price);
                        }
                        vt++;
                    }
                     Session["MyCart"] = listcart;
                }
                else
                {
                    //chưa có
                    listcart.Add(cartitem);
                    Session["MyCart"] = listcart;
                }
               
            }
            return RedirectToAction("Index","Cart");
        }

        public ActionResult CartDelete(int productid)
        {
            if (!Session["MyCart"].Equals(""))
            {
                List<CartItem> listcart = (List<CartItem>)Session["MyCart"];             
                listcart.RemoveAll(n => n.C_ProductID == productid);             
                Session["MyCart"] = listcart;
            }
                return RedirectToAction("Index", "Cart");
        }
        public ActionResult CartUpdate(FormCollection form)
        {
            if (!string.IsNullOrEmpty(form["CAPNHAT"]))
            {

                var listqty = form["qty"];
                var listarr = listqty.Split(','); // mảng
                List<CartItem> listcart = (List<CartItem>)Session["MyCart"];
                var vt = 0;
                foreach (CartItem cartitem in listcart)
                {                   
                    
                        listcart[vt].C_Qty = int.Parse(listarr[vt]);
                        listcart[vt].C_Amount = (listcart[vt].C_Qty * listcart[vt].C_Price);
                    
                   
                    vt++;
                }
                Session["MyCart"] = listcart; //  cập nhật lại session
            }
            return RedirectToAction("Index", "Cart");

        }

        // Thanh toán
        public ActionResult Thanhtoan()
        {
           
            List<CartItem> listcart = (List<CartItem>)Session["MyCart"];
            //Kiểm tra đăng nhập khách hàng
            if (Session["UserCustomer"].Equals(""))
            {
                return Redirect("~/User/Dangnhap");//
            }
            int userid = int.Parse(Session["CustomerId"].ToString());
            User user = userDAO.getRow(userid);
            ViewBag.user = user;
            return View("Thanhtoan", listcart);
        }

        public ActionResult DatMua(FormCollection field)
        {
            //Lưu thông tin vào SQL:order và orderDetail
            int userid = int.Parse(Session["CustomerId"].ToString());
            User user = userDAO.getRow(userid);


            return View("Thanhtoan");
        }

        //private int TongSL()
        //{
        //    try
        //    {
        //        int iTongSL = 0;
        //        List<CartItem> listcart = (List<CartItem>)Session["MyCart"];
        //        if (listcart != null)
        //        {
        //            iTongSL = listcart.Count();
        //        }
        //        return iTongSL;
        //    }
        //    catch
        //    {
        //        return 0;
        //    }
        //}


        ////Tính tổng số lượng
        //    private int TongSL()
        //    {
        //        try
        //        {
        //            int iTongSL = 0;
        //            List<Cart> lstCart = Session["Cart"] as List<Cart>;
        //            if (lstCart != null)
        //            {
        //                iTongSL = lstCart.Sum(n => n.SoLuong);
        //            }
        //        return iTongSL;
        //        }
        //        catch
        //        {
        //            return 0;
        //        }
        //    }
        ////Cập nhật giỏ hàng 

        //public ActionResult UpdateCart(int iMaSP,FormCollection f)
        //{
        //    Product sp = db.Products.SingleOrDefault(n => n.ID == iMaSP);
        //    if (sp == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    List<Cart> lstCart = GetCart();
        //    Cart product = lstCart.SingleOrDefault(n => n.iMasp == iMaSP);
        //    if (product != null)
        //    {
        //        product.SoLuong = int.Parse(f["txtSoLuong"].ToString());
        //    }
        //    return RedirectToAction("Cart");
        //}


        //    List<Cart> lstCart = GetCart();
        //    Cart product = lstCart.SingleOrDefault(n => n.iMasp == iMaSP);
        //    if (product == null)
        //    {
        //        lstCart.RemoveAll(n => n.iMasp == iMaSP);
        //    }
        //    if (lstCart.Count == 0)
        //    {
        //        return RedirectToAction("Index", "HouseWare");
        //    }


        //public ActionResult Cart()
        //{
        //    //if (Session["Cart"] == null)
        //    //{
        //    //    return RedirectToAction("Index", "HouseWare");
        //    //}
        //    List<Cart> lstCart = GetCart();
        //    return View(lstCart);
        //}

        ////Lấy giỏ hàng 
        //public List<Cart> GetCart()
        //{
        //    List<Cart> lstCart = Session["Cart"] as List<Cart>;
        //    if (lstCart == null)
        //    {
        //        lstCart = new List<Cart>();
        //        Session["Cart"] = lstCart;
        //    }
        //    return lstCart;
        //}
        ////Thêm giỏ hàng
        //public ActionResult InsertCart(int iMasps, string strURL)
        //{
        //    Product sp = db.Products.SingleOrDefault(n => n.ID == iMasps);
        //    if (sp == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    List<Cart> lstCart = GetCart();
        //    Cart product = lstCart.Find(n => n.iMasp == iMasps);
        //    if (product == null)
        //    {
        //        product = new Cart(iMasps);

        //        lstCart.Add(product);
        //        return Redirect(strURL);
        //    }
        //    else
        //    {
        //        product.SoLuong++;
        //        return Redirect(strURL);
        //    }
        //}
        ////Cập nhật giỏ hàng 

        //public ActionResult UpdateCart(int iMaSP,FormCollection f)
        //{
        //    Product sp = db.Products.SingleOrDefault(n => n.ID == iMaSP);
        //    if (sp == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    List<Cart> lstCart = GetCart();
        //    Cart product = lstCart.SingleOrDefault(n => n.iMasp == iMaSP);
        //    if (product != null)
        //    {
        //        product.SoLuong = int.Parse(f["txtSoLuong"].ToString());
        //    }
        //    return RedirectToAction("Cart");
        //}

        ////Xóa giỏ hàng
        //public ActionResult DeleteCart(int iMaSP)
        //{
        //    Product sp = db.Products.SingleOrDefault(n => n.ID == iMaSP);
        //    if (sp == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    List<Cart> lstCart = GetCart();
        //    Cart product = lstCart.SingleOrDefault(n => n.iMasp == iMaSP);
        //    if (product == null)
        //    {
        //        lstCart.RemoveAll(n => n.iMasp == iMaSP);
        //    }
        //    if (lstCart.Count == 0)
        //    {
        //        return RedirectToAction("Index", "HouseWare");
        //    }
        //    return RedirectToAction("Cart");
        //}
        ////Tính tổng số lượng và tổng tiền
        ////Tính tổng số lượng
        //    private int TongSL()
        //    {
        //        try
        //        {
        //            int iTongSL = 0;
        //            List<Cart> lstCart = Session["Cart"] as List<Cart>;
        //            if (lstCart != null)
        //            {
        //                iTongSL = lstCart.Sum(n => n.SoLuong);
        //            }
        //        return iTongSL;
        //        }
        //        catch
        //        {
        //            return 0;
        //        }
        //    }

        ////Tính tổng thành tiền
        //private double TongTien()
        //{
        //    double dTongTien = 0;
        //    List<Cart> lstCart = Session["Cart"] as List<Cart>;
        //    if(lstCart != null)
        //    {
        //        dTongTien = lstCart.Sum(n => n.ThanhTien);
        //    }
        //    return dTongTien;
        //}
        ////tạo partial giỏ hàng
        //public ActionResult CartPartial()
        //{
        //    ViewBag.TongSL = TongSL();
        //    ViewBag.TongTien = TongTien();
        //    return PartialView();
        //}
        //public ActionResult SuaCart()
        //{
        //    if (Session["Cart"] == null)
        //    {
        //        return RedirectToAction("Index", "HouseWare");
        //    }
        //    List<Cart> lstCart = GetCart();
        //    return View(lstCart);
        //}
    }
}