--Creacion vista para EmpleadosIndex
CREATE or ALTER VIEW VW_EmployeesView AS
Select
	e.emp_no,e.first_name, e.last_name,e.ci,e.birth_date,e.hire_date,e.gender,e.correo, 
	d.dept_name,t.title,s.salary,s.to_date, e.estado,u.usuario
FROM employees e
join users u on e.emp_no = u.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
join salaries s on e.emp_no = s.emp_no
join titles t on e.emp_no = t.emp_no



--Procedure para Registrar empleados y creacion de usuario automática 

CREATE or ALTER Procedure [dbo].[spRegistrarUsuario](
	-- Parametros
	@cedula		varchar(50),
	@nombre		varchar(50),
	@apellido	varchar(50),
	@correo		varchar(100),
	@genero		char(1),
	@fecha		varchar(50),
	@clave		varchar (255),
	@retorno	int output,
	@mensaje	varchar (100) output
)
AS
BEGIN 
	declare @usuario varchar(100)
	declare @id int
	declare @id_ultimoEmployees int

	if(not Exists (Select *from employees where correo=@correo and ci=@cedula))
	BEGIN
		--Select @id_ultimoEmployees = max(emp_no)+1 from employees
		INSERT INTO employees(birth_date,first_name,last_name,gender,hire_date,correo,ci) VALUES
		(CONVERT(varchar(10),@fecha,105),@nombre,@apellido,@genero,CONVERT(varchar(10),GETDATE(),105),@correo,@cedula)
		
		Select @id = emp_no from employees where correo=@correo and ci=@cedula
		
		Select @usuario = CONCAT(SUBSTRING(@nombre,1,2),@apellido)

		INSERT INTO users(emp_no,usuario,clave) Values (@id,@usuario,@clave)

		set @retorno=1
		set @mensaje='El usuario se ha registrado con éxito'
		Select @retorno,@mensaje
	END
	ELSE
	BEGIN
		set @retorno=0
		set @mensaje='El usuario ya esta registrado'
		Select @retorno,@mensaje
	END
END

-- Procedure para cambiar el estado de los empleados
CREATE or ALTER PROCEDURE sp_CambiarEstadoEmpleado
    @emp_no INT,
    @nuevoEstado INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el estado solo sea 0 o 1
    IF (@nuevoEstado NOT IN (0,1))
    BEGIN
        RAISERROR('El estado debe ser 0 (Inactivo) o 1 (Activo)', 16, 1);
        RETURN;
    END

    UPDATE employees
    SET estado = @nuevoEstado
    WHERE emp_no = @emp_no;
END

---Procedure para actualizar empleado

CREATE or ALTER PROCEDURE sp_ActualizarEmpleado
    @emp_no INT,
    @ci VARCHAR(50),
    @birth_date VARCHAR(50),
    @nombre VARCHAR(50),
    @apellido VARCHAR(50),
    @genero CHAR(1),
    @hire_date VARCHAR(50),
    @correo VARCHAR(100)
AS
BEGIN
    UPDATE Employees
    SET ci = @ci,
        birth_date = @birth_date,
        first_name = @nombre,
        last_name = @apellido,
        gender = @genero,
        hire_date = @hire_date,
        correo = @correo
    WHERE emp_no = @emp_no

	Declare @usuario VARCHAR(100)
	SET @usuario =CONCAT(SUBSTRING(@nombre,1,2),@apellido)
	UPDATE users
	SET usuario=@usuario
	where emp_no = @emp_no
END

--Procedure para Dashboard

CREATE OR ALTER PROCEDURE sp_DashboardDatos
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
        (SELECT COUNT(*) FROM employees WHERE estado = 1) AS EmpleadosActivos,
        (SELECT COUNT(*) FROM departments) AS TotalDepartamentos,
        (SELECT COUNT(*) FROM salaries WHERE TRY_CAST(to_date AS DATE) > GETDATE()) AS SalariosVigentes,
        (SELECT COUNT(*) FROM salaries WHERE TRY_CAST(to_date AS DATE) BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE())) AS SalariosAlerta
END

--Para departamentos
CREATE VIEW dbo.vw_Departments
AS
SELECT dept_no AS DeptNo, dept_name AS DeptName
FROM dbo.departments;
GO


CREATE PROCEDURE dbo.spGetAllDepartments
AS
BEGIN
    SELECT dept_no AS DeptNo, dept_name AS DeptName
    FROM dbo.vw_Departments;
END
GO


CREATE PROCEDURE dbo.spGetDepartmentById
    @DeptNo INT
AS
BEGIN
    SELECT dept_no AS DeptNo, dept_name AS DeptName
    FROM dbo.vw_Departments
    WHERE dept_no = @DeptNo;
END
GO

CREATE PROCEDURE dbo.spCreateDepartment
    @DeptName VARCHAR(50)
AS
BEGIN
    INSERT INTO dbo.departments (dept_name)
    VALUES (@DeptName);
END
GO

CREATE PROCEDURE dbo.spUpdateDepartment
    @DeptNo INT,
    @DeptName VARCHAR(50)
AS
BEGIN
    UPDATE dbo.departments
    SET dept_name = @DeptName
    WHERE dept_no = @DeptNo;
END
GO

CREATE PROCEDURE dbo.spDeleteDepartment
    @DeptNo INT
AS
BEGIN
    DELETE FROM dbo.departments
    WHERE dept_no = @DeptNo;
END
GO
