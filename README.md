# AppNomina

Sistema de Gestión de Nómina desarrollado en **ASP.NET MVC 5 + Entity Framework 6**.  
El proyecto se conecta a la base de datos **EmpleadosReutilizacion** en SQL Server.

---

## Tecnologías utilizadas

- ASP.NET MVC 5
- Entity Framework 6 (Database First/Code First con DataAnnotations)
- SQL Server
- Bootstrap (para estilos en las vistas)

---

## Base de datos

El proyecto trabaja con la base de datos **EmpleadosReutilizacion** que contiene las siguientes tablas:

- `departments`
- `employees`
- `dept_emp`
- `dept_manager`
- `titles`
- `salaries`
- `users`
- `Log_AuditoriaSalarios`

 El script completo de creación de la base se encuentra en `Scripts/EmpleadosReutilizacion.sql`.

---

## Estructura del proyecto

```
AppNomina/
│
├── Controllers/
│   ├── DepartamentoController.cs   # CRUD de Departamentos
│   ├── EmpleadoController.cs       # CRUD de Empleados
│   └── AccesoController.cs         # Control de acceso/login
│
├── Models/
│   ├── EmpleadosReutilizacionContext.cs  # DbContext con todas las entidades
│   ├── Department.cs                     # Modelo Departamento
│   ├── Employee.cs                       # Modelo Empleado
│   └── ...                               # Otros modelos (Salaries, Titles, etc.)
│
├── Views/
│   ├── Departamento/   # Vistas CRUD de departamentos
│   ├── Empleado/       # Vistas CRUD de empleados
│   └── Shared/         # Layouts y parciales
│
├── Scripts/            # Script SQL para la BD
├── Content/            # CSS y estilos
└── README.md           # Este archivo
```

---

## Instalación y configuración

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tuusuario/AppNomina.git
   ```

2. Crea la base de datos en SQL Server ejecutando el script:
   ```sql
   Scripts/EmpleadosReutilizacion.sql
   ```

3. Configura la cadena de conexión en **Web.config**:
   ```xml
   <connectionStrings>
     <add name="EmpleadosReutilizacion"
          connectionString="Data Source=.;Initial Catalog=EmpleadosReutilizacion;Integrated Security=True;MultipleActiveResultSets=True"
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```

   >  Ajusta `Data Source=.;` si usas otra instancia de SQL Server (`.\SQLEXPRESS`, `localhost,1433`, etc).

4. Ejecuta el proyecto desde Visual Studio:
   ```
   Ctrl + F5
   ```

---

##  Funcionalidades actuales

###  Departamentos
- Listar todos los departamentos
- Crear un nuevo departamento
- Editar información
- Eliminar departamento
- Ver detalles

### Empleados
- Listar todos los empleados
- Crear nuevo empleado con datos personales
- Editar información existente
- Eliminar empleado
- Ver detalles completos
- Campos soportados: **CI, Nombre, Apellido, Género, Fecha de nacimiento, Fecha de contratación, Correo, Estado**

### Login de usuarios
- Basado en tabla `users` (en desarrollo)

---

##  Próximos pasos

- Implementar CRUD completo para **Salarios** y **Títulos**.
- Agregar seguridad con **ASP.NET Identity**.
- Auditoría de cambios en salarios (usando `Log_AuditoriaSalarios`).
- Mejorar diseño con Bootstrap y plantillas modernas.

---

## Autores

- Mateo Escudero  
- Andy Guallichico
