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
        public ActionResult Autenticacion()
        {
            return View();
        }

        public ActionResult Registrar()
        {
            return View();
        }

        //POST
        [HttpPost]
        
        public ActionResult Autenticacion(Empleado oEmpleado)
        {
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
                    oEmpleado.mensaje = cmd.Parameters["mensaje"].Value.ToString();

                    cn.Close();

                    if (oEmpleado.Id == 1)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    else if (oEmpleado.Id == 0)
                    {
                        return RedirectToAction("Registrar", "Acceso");
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

        // POST
        [HttpPost]
        public ActionResult Registrar(Empleado oEmpleado)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString))
                {
                    SqlCommand comando = new SqlCommand("spRegistrarUsuario", cn);
                    comando.Parameters.AddWithValue("cedula", oEmpleado.cedula);
                    comando.Parameters.AddWithValue("nombre", oEmpleado.nombre);
                    comando.Parameters.AddWithValue("apellido", oEmpleado.apellido);
                    comando.Parameters.AddWithValue("correo", oEmpleado.correo);
                    comando.Parameters.AddWithValue("genero", oEmpleado.genero);
                    comando.Parameters.AddWithValue("fecha", oEmpleado.birth_date);
                    comando.Parameters.AddWithValue("clave", oEmpleado.clave);
                    comando.Parameters.Add("retorno", SqlDbType.Int).Direction = ParameterDirection.Output;
                    comando.Parameters.Add("mensaje", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;
                    comando.CommandType = CommandType.StoredProcedure;
                    cn.Open();
                    comando.ExecuteNonQuery();

                    oEmpleado.Id = Convert.ToInt32(comando.Parameters["retorno"].Value);
                    oEmpleado.mensaje = comando.Parameters["mensaje"].Value.ToString();

                    cn.Close();
                }

                if (oEmpleado.Id == 1)
                {
                    return RedirectToAction("Autenticacion", "Acceso");
                }
                else if (oEmpleado.Id == 0)
                {
                    return RedirectToAction("Autenticacion", "Acceso");
                }
                else
                {
                    return View();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error" + e);
                return View();
            }
        }

    }
}
