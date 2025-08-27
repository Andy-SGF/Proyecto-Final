using System.Collections.Generic;
using System.Data.Entity;

namespace AppNomina.Models
{
    public class EmpleadosReutilizacionContext : DbContext
    {
        // Usa la cadena de conexión "Cnn" definida en Web.config
        public EmpleadosReutilizacionContext() : base("name=Cnn")
        {
        }

        // Aquí defines las tablas que vas a mapear
        public DbSet<Department> Departments { get; set; }
        // Más adelante puedes añadir Employees, Salaries, etc.
    }
}
