using HouseWare.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseWare.Controllers
{
    public class HouseWareController : Controller
    {
        HouseWare_Context db = new HouseWare_Context();
        // GET: HouseWare
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Introduce()
        {
            return View();
        }
        public ActionResult News()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult RenderNav()
        {
           
            List<Categone> ListLoai = db.Categones.ToList();
            return PartialView("HouseWare_Header",ListLoai);
        }
        public ActionResult RenderProduct()
        {
            List<Product> ListHang = db.Products.ToList();
            return PartialView("HouseWare_MainTop",ListHang);
        }
       
    }
}