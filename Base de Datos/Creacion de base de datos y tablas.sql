-- Crear la base de datos
CREATE DATABASE EmpleadosReutilizacion;
GO

-- Usar la base de datos recién creada
USE EmpleadosReutilizacion;
GO

--Creacion de la tabla departaments
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[departments](
	[dept_no] [int] IDENTITY(1,1) NOT NULL,
	[dept_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Creacion de la tabla empleados

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[employees](
	[emp_no] [int] IDENTITY(1,1) NOT NULL,
	[ci] [varchar](50) NOT NULL,
	[birth_date] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [char](1) NOT NULL,
	[hire_date] [varchar](50) NOT NULL,
	[correo] [varchar](100) NULL,
	[estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[employees] ADD  CONSTRAINT [DF__employees__estado__2CBDA3B5]  DEFAULT ((0)) FOR [estado]
GO

--Creacion de la tabla dept_emp

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dept_emp](
	[emp_no] [int] NOT NULL,
	[dept_no] [int] NOT NULL,
	[from_date] [varchar](50) NOT NULL,
	[to_date] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[dept_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[dept_emp]  WITH CHECK ADD FOREIGN KEY([dept_no])
REFERENCES [dbo].[departments] ([dept_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[dept_emp]  WITH CHECK ADD FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--Creacion de la tabla dept_manager

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dept_manager](
	[emp_no] [int] NOT NULL,
	[dept_no] [int] NOT NULL,
	[from_date] [varchar](50) NOT NULL,
	[to_date] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[dept_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[dept_manager]  WITH CHECK ADD FOREIGN KEY([dept_no])
REFERENCES [dbo].[departments] ([dept_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[dept_manager]  WITH CHECK ADD FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--Creacion de la tabla titles

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[titles](
	[emp_no] [int] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[from_date] [varchar](50) NOT NULL,
	[to_date] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[title] ASC,
	[from_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[titles]  WITH CHECK ADD FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--Creacion de la tabla salaries

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[salaries](
	[emp_no] [int] NOT NULL,
	[salary] [bigint] NOT NULL,
	[from_date] [varchar](50) NOT NULL,
	[to_date] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[from_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[salaries]  WITH CHECK ADD FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--Creacion de la tabla users

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[emp_no] [int] NOT NULL,
	[usuario] [varchar](100) NOT NULL,
	[clave] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employees] FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_Users_Employees]
GO

--Creacion de la tabla Log_AuditoriaSalarios

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Log_AuditoriaSalarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[fechaActualizacion] [date] NOT NULL,
	[DetalleCambio] [varchar](50) NOT NULL,
	[salario] [bigint] NOT NULL,
	[emp_no] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Log_AuditoriaSalarios]  WITH CHECK ADD  CONSTRAINT [FK_LogAuditoriaSalarios_Employees] FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Log_AuditoriaSalarios] CHECK CONSTRAINT [FK_LogAuditoriaSalarios_Employees]
GO
