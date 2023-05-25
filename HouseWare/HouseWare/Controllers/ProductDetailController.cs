using HouseWare.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseWare.Controllers
{
    public class ProductDetailController : Controller
    {
        HouseWare_Context db = new HouseWare_Context(); 
        // GET: ProductDetail
        public ActionResult DetailPro(int Masp = 0)
        {
            var chitiet = db.Products.SingleOrDefault(n => n.ID == Masp);
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }
        public ActionResult Search(string key= "")
        {
            ViewBag.Key = key;
            var listSearch = db.Products.Where(sp => sp.Name.Contains(key) == true).ToList();
            return View(listSearch);
        }

       
    }
}