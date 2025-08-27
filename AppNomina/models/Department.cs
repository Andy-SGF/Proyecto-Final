using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AppNomina.Models
{
    public class Department
    {
        public int DeptNo { get; set; }  // Número de departamento
        public string DeptName { get; set; }  // Nombre del departamento
    }
}
