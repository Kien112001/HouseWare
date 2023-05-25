using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HouseWare.Models.Entities;

namespace HouseWare.Areas.Admin.Controllers
{
    public class CategoneController : Controller
    {
        private HouseWare_Context db = new HouseWare_Context();

        // GET: Admin/Categone
        public ActionResult Index()
        {
            return View(db.Categones.ToList());
        }

        // GET: Admin/Categone/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categone categone = db.Categones.Find(id);
            if (categone == null)
            {
                return HttpNotFound();
            }
            return View(categone);
        }

        // GET: Admin/Categone/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Categone/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name")] Categone categone)
        {
            if (ModelState.IsValid)
            {
                db.Categones.Add(categone);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(categone);
        }

        // GET: Admin/Categone/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categone categone = db.Categones.Find(id);
            if (categone == null)
            {
                return HttpNotFound();
            }
            return View(categone);
        }

        // POST: Admin/Categone/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name")] Categone categone)
        {
            if (ModelState.IsValid)
            {
                db.Entry(categone).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(categone);
        }

        // GET: Admin/Categone/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categone categone = db.Categones.Find(id);
            if (categone == null)
            {
                return HttpNotFound();
            }
            return View(categone);
        }

        // POST: Admin/Categone/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Categone categone = db.Categones.Find(id);
            db.Categones.Remove(categone);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
