using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AppNomina.Models
{
    [Table("Departments")]
    public class Department
    {
        [Key]
        [StringLength(4, ErrorMessage = "El código del departamento no puede tener más de 4 caracteres.")]
        [Display(Name = "Código")]
        public string DeptNo { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio.")]
        [StringLength(40, ErrorMessage = "El nombre no puede superar los 40 caracteres.")]
        [Display(Name = "Nombre del Departamento")]
        public string DeptName { get; set; }
    }
}
