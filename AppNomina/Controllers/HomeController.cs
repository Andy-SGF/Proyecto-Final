using AppNomina.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppNomina.Controllers
{
    public class HomeController : Controller
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;
        //GET: 
        public ActionResult Index()
        {
            var model = new Dashboard();

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand("sp_DashboardDatos", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            model.TotalEmpleados = Convert.ToInt32(reader["EmpleadosActivos"]);
                            model.TotalDepartamentos = Convert.ToInt32(reader["TotalDepartamentos"]);
                            model.SalariosVigentes = Convert.ToInt32(reader["SalariosVigentes"]);
                            model.SalariosAlerta = Convert.ToInt32(reader["SalariosAlerta"]);
                        }
                    }
                }

                return View(model);
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Error al cargar el dashboard: " + ex.Message;
                return View(model);
            }
        }



        [HttpGet]


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }


    }
}