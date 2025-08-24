using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PayrollApp.Data;
using PayrollApp.Models;
using Microsoft.AspNetCore.Authorization;

namespace PayrollApp.Controllers
{
    [Authorize(Roles="Administrador,RRHH")]
    public class DepartmentsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public DepartmentsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Departments
        public async Task<IActionResult> Index()
        {
            return View(await _context.Departments.ToListAsync());
        }

        // GET: Departments/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Departments/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("DeptNo,DeptName")] Department department)
        {
            if (ModelState.IsValid)
            {
                _context.Add(department);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(department);
        }

        // GET: Departments/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null) return NotFound();
            var dept = await _context.Departments.FindAsync(id);
            if (dept == null) return NotFound();
            return View(dept);
        }

        // POST: Departments/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("DeptNo,DeptName")] Department department)
        {
            if (id != department.DeptNo) return NotFound();

            if (ModelState.IsValid)
            {
                _context.Update(department);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(department);
        }

        // GET: Departments/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null) return NotFound();
            var dept = await _context.Departments.FirstOrDefaultAsync(m => m.DeptNo == id);
            if (dept == null) return NotFound();
            return View(dept);
        }

        // POST: Departments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var dept = await _context.Departments.FindAsync(id);
            if (dept != null)
            {
                _context.Departments.Remove(dept);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}

