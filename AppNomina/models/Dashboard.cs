using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppNomina.Models
{
    public class Dashboard
    {
        public int TotalEmpleados {  get; set; }
        public int TotalDepartamentos { get; set; }
        public int SalariosVigentes { get; set; }
        public int SalariosAlerta { get; set; }
    }
}