using System.Linq;
using System.Net;
using System.Web.Mvc;
using System.Data.Entity;
using AppNomina.Models;

namespace AppNomina.Controllers
{
    [Authorize]
    public class DepartmentsController : Controller
    {
        private EmpleadosReutilizacionContext db = new EmpleadosReutilizacionContext();

        // GET: Departments
        public ActionResult Index()
        {
            return View(db.Departments.ToList());
        }

        // GET: Departments/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var department = db.Departments.Find(id);
            if (department == null)
                return HttpNotFound();

            return View(department);
        }

        // GET: Departments/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Departments/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DeptNo,DeptName")] Department department)
        {
            if (ModelState.IsValid)
            {
                db.Departments.Add(department);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(department);
        }

        // GET: Departments/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var department = db.Departments.Find(id);
            if (department == null)
                return HttpNotFound();

            return View(department);
        }

        // POST: Departments/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DeptNo,DeptName")] Department department)
        {
            if (ModelState.IsValid)
            {
                db.Entry(department).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(department);
        }

        // GET: Departments/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var department = db.Departments.Find(id);
            if (department == null)
                return HttpNotFound();

            return View(department);
        }

        // POST: Departments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            var department = db.Departments.Find(id);
            if (department != null)
            {
                db.Departments.Remove(department);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
                db.Dispose();
            base.Dispose(disposing);
        }
    }
}
