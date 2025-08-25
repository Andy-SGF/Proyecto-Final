using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AppNomina.Models
{
    public class Empleado
    {
        public int emp_no {  get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string cedula { get; set; }
        public string birth_date { get; set; }
        public char genero { get; set; }
        public string hire_date { get; set; }
        public string correo { get; set; }
        public string usuario { get; set; }
        public string clave { get; set; }
        public int Id { get; set; }
        public int estado {  get; set; }
        public string mensaje { get; set; }
        public string dept_Name { get; set; }
        public string dept_from_date { get; set; }
        public string dept_to_date { get; set; }
        public string title { get; set; }
        public string title_from_date { get; set; }
        public string title_to_date { get; set; }
        public double salary { get; set; }
        public string salary_from_date { get; set; }
        public string salary_to_date { get; set; }
    }
}