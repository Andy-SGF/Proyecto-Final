using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppNomina.Models;

// librerias para conectarme a la base de datos
using System.Data;
using System.Data.SqlClient;
// librerias para uso de funcionalidades C#
using System.Text;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using PagedList;
using PagedList.Mvc;

namespace AppNomina.Controllers
{
    public class EmpleadoController : Controller
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;
        // GET: Empleados
        public ActionResult Index(string campoFiltro, string valorFiltro, int page = 1)
        {
            var empleados = new List<Empleado>();
            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand("Select *FROM VW_EmployeesView", cn))
                {
                    cmd.CommandType = CommandType.Text;
                    cn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            empleados.Add(new Empleado
                            {
                                nombre = reader["first_name"].ToString(),
                                apellido = reader["last_name"].ToString(),
                                usuario = reader["usuario"].ToString(),
                                cedula = reader["ci"].ToString(),
                                correo = reader["correo"].ToString(),
                                dept_Name = reader["dept_name"].ToString(),
                                title = reader["title"].ToString(),
                                salary = Convert.ToDouble(reader["salary"]),
                                salary_to_date = reader["to_date"].ToString(),
                            });
                        }
                    }
                }

                // Aplicacion de filtro
                if (!string.IsNullOrEmpty(campoFiltro) && !string.IsNullOrEmpty(valorFiltro))
                {
                    string valor = valorFiltro.ToLower();

                    switch (campoFiltro)
                    {
                        case "Nombre":
                            empleados = empleados.Where(e => e.nombre != null && e.nombre.ToLower().Contains(valor)).ToList();
                            break;
                        case "Apellido":
                            empleados = empleados.Where(e => e.apellido != null && e.apellido.ToLower().Contains(valor)).ToList();
                            break;
                        case "CI":
                            empleados = empleados.Where(e => e.cedula != null && e.cedula.Contains(valor)).ToList();
                            break;
                        case "Usuario":
                            empleados = empleados.Where(e => e.usuario != null && e.usuario.ToLower().Contains(valor)).ToList();
                            break;
                        case "Correo":
                            empleados = empleados.Where(e => e.correo != null && e.correo.ToLower().Contains(valor)).ToList();
                            break;
                    }
                }
                int pageSize = 25;
                var pagedList = empleados.ToPagedList(page, pageSize);

                return View(pagedList);
            }
            catch (Exception e)
            {
                ViewBag.Error = "Ocurrio un error al obtener la lista de empleados" + e.Message;
                return View(new List<Empleado>().ToPagedList(1, 1));
            }
        }

        // GET: Empleados/Details/5
        public ActionResult Detalle(string ci)
        {
            if (string.IsNullOrEmpty(ci))
                return HttpNotFound();
            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand("Select *From VW_EmployeesView Where ci = @ci", cn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ci", ci);
                    cn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            var empleado = new Empleado
                            {
                                nombre = reader["first_name"].ToString(),
                                apellido = reader["last_name"].ToString(),
                                usuario = reader["usuario"].ToString(),
                                cedula = reader["ci"].ToString(),
                                correo = reader["correo"].ToString(),
                                dept_Name = reader["dept_name"].ToString(),
                                title = reader["title"].ToString(),
                                salary = Convert.ToDouble(reader["salary"]),
                                salary_to_date = reader["to_date"].ToString(),
                            };
                            return View(empleado);
                        }
                    }
                }
                return HttpNotFound();
            }
            catch (Exception e)
            {
                ViewBag.Error = "Error al cargar los detalles del empleado: " + e.Message;
                return View();
            }
        }

        // GET: Empleados/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Empleados/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Empleados/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Empleados/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Empleados/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Empleados/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
