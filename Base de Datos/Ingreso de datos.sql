--Insertar datos en tablas 

USE [EmpleadosReutilizacion] 
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (1, N'1732324820', N'27-03-1998', N'Sandy', N'Suarez', N'F', N'02-05-2009', N'san_suarez@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (2, N'1732324821', N'25-04-1992', N'Brenda', N'Jara', N'F', N'05-02-2008', N'brendaJ@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (3, N'1712324822', N'04-12-1991', N'Christian', N'Torres', N'M', N'07-11-2007', N'chrisTorres@hotmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (4, N'1742324823', N'20-09-1997', N'Diego', N'Bautista', N'M', N'17-07-2015', N'diego-bau@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (5, N'1762324824', N'29-07-1988', N'Elena', N'Caraguay', N'F', N'05-08-2017', N'elenaC@hotmail.com', 0)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (6, N'1722324825', N'03-11-1989', N'Francisco', N'Mendoza', N'M', N'10-12-2006', N'franc_mendoza@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (7, N'1712324826', N'20-06-1990', N'Gabriela', N'De la Cruz', N'F', N'07-01-2005', N'gaby_cruz@hotmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (8, N'1702324827', N'25-01-1999', N'Henry', N'Garcia', N'M', N'01-06-2014', N'henry12@hotmail.com', 0)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (9, N'1722324828', N'06-09-1997', N'Andrea', N'Caraguay', N'F', N'16-12-2009', N'andrea_caraguay@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (10, N'1712324829', N'06-02-1987', N'Julio', N'Paez', N'M', N'23-03-2007', N'julioP@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (11, N'1732320001', N'27-04-2000', N'Mariana', N'Lopez', N'F', N'04-08-2025', N'marianaL@hotmail.com', 0)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (12, N'1745313332', N'29-04-1997', N'Andy', N'Guallichico', N'H', N'22-08-2025', N'andyg123@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (13, N'1745313332', N'29-04-1997', N'Andy', N'Guallichico', N'H', N'22-08-2025', N'andy.Guallichico@gmail.com', 1)
INSERT [dbo].[employees] ([emp_no], [ci], [birth_date], [first_name], [last_name], [gender], [hire_date], [correo], [estado]) VALUES (14, N'1735264537', N'12-04-1996', N'Alison', N'Flores', N'M', N'23-08-2025', N'aliss.flores@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO

SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (1, N'Recursos Humanos')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (2, N'Tecnología')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (3, N'Finanzas')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (4, N'Marketing')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (5, N'Logística')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (6, N'Legal')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (7, N'Atención al Cliente')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (8, N'Comercial')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (9, N'Innovación')
INSERT [dbo].[departments] ([dept_no], [dept_name]) VALUES (10, N'Calidad')
SET IDENTITY_INSERT [dbo].[departments] OFF
GO

-- dept_emp
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (1, 2, N'02-05-2009', N'02-05-2016')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (1, 4, N'03-05-2016', N'02-05-2023')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (2, 1, N'05-02-2008', N'05-02-2024')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (3, 3, N'07-11-2007', N'07-11-2012')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (3, 5, N'08-11-2012', N'07-11-2020')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (4, 2, N'17-07-2015', N'17-07-2025')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (5, 4, N'05-08-2017', N'05-08-2022')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (5, 10, N'06-08-2022', N'05-08-2025')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (6, 1, N'11-12-2012', N'10-12-2019')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (6, 3, N'10-12-2006', N'10-12-2012')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (7, 6, N'07-01-2005', N'07-01-2018')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (8, 2, N'01-06-2014', N'01-06-2020')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (8, 9, N'02-06-2020', N'01-06-2025')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (9, 7, N'17-12-2016', N'16-12-2023')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (9, 8, N'16-12-2009', N'16-12-2016')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (10, 1, N'23-03-2007', N'23-03-2021')
INSERT [dbo].[dept_emp] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (11, 4, N'04-08-2025', N'31-12-2028')
GO

-- users
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (1, N'SaSuarez', N'alicia1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (2, N'brendaS', N'brenda1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (3, N'chTorres', N'christian1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (4, N'dBautista', N'diego1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (5, N'CaraguayE', N'elena1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (6, N'MendozaF', N'francisco1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (7, N'CruzG', N'gabriela1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (8, N'GarciaH', N'henry1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (9, N'CaraguayA', N'andrea1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (10, N'PaezJ', N'julio1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (11, N'LopezM', N'mariana1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (13, N'aGuallichico', N'andy1234')
INSERT [dbo].[users] ([emp_no], [usuario], [clave]) VALUES (14, N'AlFlores', N'aliss1234')
GO

-- Log_AuditoriaSalarios
SET IDENTITY_INSERT [dbo].[Log_AuditoriaSalarios] ON 
INSERT [dbo].[Log_AuditoriaSalarios] ([id], [usuario], [fechaActualizacion], [DetalleCambio], [salario], [emp_no]) VALUES (1, N'user_admin', CAST(N'04-08-2025' AS Date), N'Nuevo Empleado', 45000, 11)
SET IDENTITY_INSERT [dbo].[Log_AuditoriaSalarios] OFF
GO

-- dept_manager
INSERT [dbo].[dept_manager] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (2, 1, N'01-01-2020', N'31-12-2025')
INSERT [dbo].[dept_manager] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (4, 2, N'01-01-2022', N'31-12-2025')
INSERT [dbo].[dept_manager] ([emp_no], [dept_no], [from_date], [to_date]) VALUES (5, 10, N'01-01-2023', N'31-12-2025')
GO

-- titles
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (1, N'Analista de Sistemas', N'02-05-2009', N'02-05-2016')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (1, N'Especialista en Marketing', N'03-05-2016', N'02-12-2025')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (2, N'Gerente de RRHH', N'05-02-2008', N'05-02-2024')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (3, N'Contador', N'07-11-2007', N'07-11-2012')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (3, N'Supervisor Logístico', N'08-11-2012', N'07-02-2026')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (4, N'Líder de Desarrollo', N'17-07-2015', N'17-07-2025')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (5, N'Gerente de Calidad', N'05-08-2017', N'05-08-2022')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (5, N'Jefa de Marketing', N'06-08-2022', N'05-08-2026')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (6, N'Analista de Personal', N'11-12-2006', N'10-12-2012')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (6, N'Asistente Financiero', N'11-12-2012', N'10-12-2019')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (7, N'Abogada Corporativa', N'07-01-2005', N'07-01-2018')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (8, N'Desarrollador Jr.', N'01-06-2014', N'01-06-2020')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (8, N'Ingeniero en Innovación', N'02-06-2020', N'01-12-2025')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (9, N'Ejecutiva Comercial', N'16-12-2009', N'16-12-2016')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (9, N'Supervisora de Atención', N'17-12-2016', N'16-12-2023')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (10, N'Especialista en Relaciones Laborales', N'23-03-2007', N'23-03-2021')
INSERT [dbo].[titles] ([emp_no], [title], [from_date], [to_date]) VALUES (11, N'Diseñador Gráfico', N'04-08-2025', N'31-12-2028')
GO

-- salaries
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (1, 2400, N'02-05-2009', N'02-05-2016')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (1, 3000, N'03-05-2016', N'02-12-2025')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (2, 3500, N'05-02-2008', N'05-02-2024')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (3, 2200, N'07-11-2007', N'07-11-2012')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (3, 2700, N'08-11-2012', N'07-02-2026')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (4, 4000, N'17-07-2015', N'17-07-2025')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (5, 3600, N'05-08-2017', N'05-08-2022')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (5, 4200, N'06-08-2022', N'05-08-2026')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (6, 2000, N'10-12-2006', N'10-12-2012')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (6, 2500, N'11-12-2012', N'10-12-2019')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (7, 2400, N'07-01-2005', N'07-01-2018')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (8, 2100, N'01-06-2014', N'01-06-2020')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (8, 2800, N'02-06-2020', N'01-12-2025')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (9, 2300, N'16-12-2009', N'16-12-2016')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (9, 2800, N'17-12-2016', N'16-12-2023')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (10, 2900, N'23-03-2007', N'23-03-2021')
INSERT [dbo].[salaries] ([emp_no], [salary], [from_date], [to_date]) VALUES (11, 45000, N'04-08-2025', N'31-12-2028')
GO