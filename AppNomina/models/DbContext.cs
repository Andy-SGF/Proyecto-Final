using System.Collections.Generic;
using System.Data.Entity;

namespace AppNomina.Models
{
    public class DepartamentosContext : DbContext
    {
        // En Web.config debes tener una cadena de conexión llamada "DepartamentosContext"
        // apuntando a tu BD "Departamentos"
        public DepartamentosContext() : base("name=DepartamentosContext")
        {
        }

        public DbSet<Department> Departments { get; set; }
    }
}
