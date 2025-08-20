using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BCrypt.Net;

// librerias para conectarme a la base de datos
using System.Data;
using System.Data.SqlClient;

// librerias para uso de funcionalidades C#
using System.Text;
using System.Web.UI.WebControls;
using System.Configuration;
using Microsoft.Ajax.Utilities;
using AppNomina.Models;

namespace AppNomina.Controllers
{
    public class AccesoController : Controller
    {

        //GET: Acceso 
        [HttpGet]
        public ActionResult Autenticar()
        {
            return View();
        }

        //POST
        [HttpPost]
        
        public ActionResult Autenticar(Empleado oEmpleado)
        {
            string mensaje = "";
            try
            {
                using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("spValidarUsuario", cn);
                    cmd.Parameters.AddWithValue("usuario", oEmpleado.usuario);
                    cmd.Parameters.AddWithValue("clave", oEmpleado.clave);
                    cmd.Parameters.Add("id", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("mensaje", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    oEmpleado.Id = Convert.ToInt32(cmd.Parameters["id"].Value);
                    mensaje = cmd.Parameters["mensaje"].Value.ToString();

                    cn.Close();

                    if (oEmpleado.Id == 1)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    else if (oEmpleado.Id == 0)
                    {
                        return View();
                    }
                    else
                    {
                        return View();
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e);
                return View();
            }
        }

    }
}
