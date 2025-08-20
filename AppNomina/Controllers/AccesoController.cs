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
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("usuario", oEmpleado.usuario);

                    SqlParameter paramHash = new SqlParameter("hash", SqlDbType.NVarChar, 255) { Direction = ParameterDirection.Output };
                    SqlParameter paramId = new SqlParameter("id", SqlDbType.Int) { Direction = ParameterDirection.Output };
                    SqlParameter paramMensaje = new SqlParameter("mensaje", SqlDbType.VarChar, 100) { Direction = ParameterDirection.Output };

                    cmd.Parameters.Add(paramHash);
                    cmd.Parameters.Add(paramId);
                    cmd.Parameters.Add(paramMensaje);

                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();

                    string hash = paramHash.Value?.ToString();
                    int id = Convert.ToInt32(paramId.Value);
                    if (id == 1 && !string.IsNullOrEmpty(hash) && BCrypt.Net.BCrypt.Verify(oEmpleado.clave,hash))
                    {
                        return RedirectToAction("Index","Home");
                    } else if (id ==0){
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
