using HouseWare.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseWare.Controllers
{
    public class ProductUsController : Controller
    {
        HouseWare_Context db = new HouseWare_Context();

        // GET: ProductUs
        public ActionResult LoadPro()
        {
            List<Product> ListHang = db.Products.Where(sp=>sp.Gia> 10000).ToList();                
            return View(ListHang);
        }
        public ActionResult LoadProductByCatID(int CatID)
        {
            List<Product> ListHang = db.Products.Where(h => h.IdCategone == CatID).ToList();
            return PartialView("LoadPro", ListHang);
        }

    }
}