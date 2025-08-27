using AppNomina.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

// librerias para uso de funcionalidades C#
using System.Text;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;

namespace AppNomina.Controllers
{
    public class DepartamentController : Controller
    {
        // Método para obtener todos los departamentos
        public ActionResult Index()
        {
            List<Department> departments = new List<Department>();
            string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT DeptNo, DeptName FROM dbo.vw_Departments", cn);
                cmd.CommandType = CommandType.Text;

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    departments.Add(new Department
                    {
                        DeptNo = Convert.ToInt32(reader["DeptNo"]),
                        DeptName = reader["DeptName"].ToString()
                    });
                }
            }

            return View(departments);  // Pasamos la lista de departamentos a la vista
        }

        // Método para obtener un departamento por su ID
        public ActionResult Details(int id)
        {
            Department department = null;
            string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetDepartmentById", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DeptNo", id);

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    department = new Department
                    {
                        DeptNo = Convert.ToInt32(reader["DeptNo"]),
                        DeptName = reader["DeptName"].ToString()
                    };
                }
            }

            if (department == null)
                return HttpNotFound();  // Si no encuentra el departamento, devuelve un error 404

            return View(department);  // Pasa el departamento a la vista
        }

        // Método para mostrar el formulario de creación de departamento
        public ActionResult Create()
        {
            return View();
        }

        // Método para crear un departamento (POST)
        [HttpPost]
        public ActionResult Create(Department department)
        {
            if (ModelState.IsValid)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spCreateDepartment", cn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@DeptName", department.DeptName);

                    cn.Open();
                    cmd.ExecuteNonQuery();  // Ejecuta el procedimiento almacenado para insertar

                    return RedirectToAction("Index");  // Redirige al índice con la lista de departamentos
                }
            }

            return View(department);  // Si hay errores de validación, vuelve a la vista de crear
        }

        // Método para mostrar el formulario de edición de un departamento
        public ActionResult Edit(int id)
        {
            Department department = null;
            string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetDepartmentById", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DeptNo", id);

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    department = new Department
                    {
                        DeptNo = Convert.ToInt32(reader["DeptNo"]),
                        DeptName = reader["DeptName"].ToString()
                    };
                }
            }

            if (department == null)
                return HttpNotFound();  // Si no encuentra el departamento, devuelve un error 404

            return View(department);  // Pasa el departamento a la vista de editar
        }

        // Método para actualizar un departamento (POST)
        [HttpPost]
        public ActionResult Edit(Department department)
        {
            if (ModelState.IsValid)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spUpdateDepartment", cn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@DeptNo", department.DeptNo);
                    cmd.Parameters.AddWithValue("@DeptName", department.DeptName);

                    cn.Open();
                    cmd.ExecuteNonQuery();  // Ejecuta el procedimiento almacenado para actualizar

                    return RedirectToAction("Index");  // Redirige al índice con la lista de departamentos
                }
            }

            return View(department);  // Si hay errores de validación, vuelve a la vista de editar
        }

        // Método para eliminar un departamento
        public ActionResult Delete(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spDeleteDepartment", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DeptNo", id);

                cn.Open();
                cmd.ExecuteNonQuery();  // Ejecuta el procedimiento almacenado para eliminar

                return RedirectToAction("Index");  // Redirige al índice con la lista de departamentos
            }
        }
    }
}
