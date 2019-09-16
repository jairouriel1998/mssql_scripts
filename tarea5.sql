/*
#########################################################################
#                               TAREA SQL                               #
#########################################################################

                      /^--^\     /^--^\     /^--^\
                      \____/     \____/     \____/
                     /      \   /      \   /      \
                    |        | |        | |        |
                     \__  __/   \__  __/   \__  __/
|^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^|
| | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | |
| | | | | | | | | | | | / / | | |\ \| | | | | |/ /| | | | | | | | | | | |
| | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | |
################    Made with 💙 by Jairo Medrano      ##################
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |


*/


-- inciso 1
Create database DB_Proyectos
on primary
( name = DB_Proyectos_M,
  filename='C:\data\DB_Proyectos.mdf',
  size = 15 MB,
  maxsize= 200 MB,
  filegrowth=20%)
log on
( name = DB_Proyectos_L,
  filename='C:\data\DB_Proyectos.ldf',
  size = 10 MB,
  maxsize= 70 MB,
  filegrowth=5)

USE DB_proyectos
go

--incisio 2
CREATE TABLE TBL_Clientes(
    codigo_cli INT PRIMARY KEY,
    nombre_cli VARCHAR(30) NOT NULL,
    nif CHAR(12) UNIQUE,
    direccion VARCHAR(30),
    ciudad CHAR(20)
)

CREATE TABLE TBL_Departamentos(
    nombre_dep VARCHAR(20),
    ciudad_dep VARCHAR(20),
    telefono INT,
    PRIMARY KEY(nombre_dep, ciudad_dep)
)

CREATE TABLE TBL_Proyectos(
    codigo_proyec INT IDENTITY(1,1),
    nombre_proyec VARCHAR(20),
    precio DECIMAL(10,2),
    fecha_inicio date,
    fecha_prev_fin date,
    fecha_fin date,
    codigo_cliente INT,
    check(fecha_inicio<fecha_prev_fin and fecha_inicio<fecha_fin),
    PRIMARY KEY(codigo_proyec)
) 

CREATE TABLE TBL_Empleados(
    codigo_empl INT IDENTITY(1,1),
    nombre_empl VARCHAR(20),
    apellido_empl VARCHAR(20),
    sueldo DECIMAL(10,2),
    nombre_dep VARCHAR(20),
    cuidad_dep VARCHAR(20),
    num_proy INT,
    PRIMARY KEY(codigo_empl),
    FOREIGN KEY(num_proy) REFERENCES TBL_Proyectos(codigo_proyec)
)

-- incisio 3
ALTER TABLE TBL_Clientes ADD telefono VARCHAR(12)

-- inciso 4
ALTER TABLE TBL_Proyectos ADD FOREIGN KEY (codigo_cliente) REFERENCES TBL_Clientes(codigo_cli)


--inciso 5
--tabla Departamentos
INSERT INTO TBL_Departamentos VALUES ('DIR', 'Barcelona','934226070')
INSERT INTO TBL_Departamentos VALUES ('DIR', 'Girona','972238970')
INSERT INTO TBL_Departamentos VALUES ('DIS', 'Lleida','973235040')
INSERT INTO TBL_Departamentos VALUES ('DIS', 'Barcelona','932248523')
INSERT INTO TBL_Departamentos VALUES ('PROG', 'Tarragona','977333852')
INSERT INTO TBL_Departamentos VALUES ('PROG', 'Girona','972235091')

--tabla TBL_Clientes
INSERT INTO TBL_Clientes VALUES (10, 'ECIGSA', '38567893C', 'Aragón 11', 'Barcelona', Null)
INSERT INTO TBL_Clientes VALUES (20, 'CME', '38123898E', 'Valencia 22', 'Girona', 972235721)
INSERT INTO TBL_Clientes VALUES (30, 'ACME', '36432127A', 'Mallorca 33', 'Lleida', 973234567)
INSERT INTO TBL_Clientes VALUES (40, 'JGM', '38782345B', 'Rosellión 44', 'Tarragona', 977337143)


--tabla TBL_Proyectos
INSERT INTO TBL_Proyectos VALUES ('GESCOM', 1.0E+6, '01-01-1998', '01-01-1999', NULL, 10)
INSERT INTO TBL_Proyectos VALUES ('PESCI', 2.0E+6, '10-01-1996', '03-31-1998', '05-01-1998', 10)
INSERT INTO TBL_Proyectos VALUES ('SALSA', 1.0E+6, '02-10-1998', '02-01-1999', NULL, 20)
INSERT INTO TBL_Proyectos VALUES ('TINELL', 4.0E+6, '01-01-1997', '12-01-1999', NULL, 30)


-- tabla TBL_Empleados

INSERT INTO TBL_Empleados VALUES ('María', 'Puig', 1.0E+5, 'DIR', 'Girona', 1)
INSERT INTO TBL_Empleados VALUES ('Pedro', 'Mas', 9.0E+4, 'DIR', 'Barcelona', 4)
INSERT INTO TBL_Empleados VALUES ('Ana', 'Ros', 7.0E+4, 'DIS', 'Lleida', 3)
INSERT INTO TBL_Empleados VALUES ('Jorge', 'Roca', 7.0E+4, 'DIS', 'Barcelona', 4)
INSERT INTO TBL_Empleados VALUES ('Clara', 'Blanc', 4.0E+4, 'PROG', 'Tarragona', 1)
INSERT INTO TBL_Empleados VALUES ('Laura', 'Tort', 3.0E+4, 'PROG', 'Tarragona', 3)
INSERT INTO TBL_Empleados VALUES ('Rogelio', 'Salt', 4.0E+4, NULL, NULL, 4)
INSERT INTO TBL_Empleados VALUES ('Sergio', 'Grau', 3.0E+4, 'PROG', 'Tarragona', NULL)


-- inciso 6
SELECT * FROM TBL_Clientes

-- inciso 7
SELECT codigo_empl FROM TBL_Empleados
wHERE num_proy = 4

-- inciso 8
SELECT DISTINCT sueldo FROM TBL_Empleados

-- inciso 9
SELECT COUNT(nombre_dep) FROM TBL_Departamentos
WHERE ciudad_dep = 'Lleida'

-- inciso 10 y 11 (repetido)
SELECT codigo_proyec, nombre_proyec FROM TBL_Proyectos
where precio in(SELECT MAX(precio) FROM TBL_Proyectos)

-- inciso 12
SELECT nombre_dep FROM TBL_Departamentos
WHERE ciudad_dep = 'Lleida' or ciudad_dep = 'Tarragona'

-- inciso 13
SELECT nombre_empl FROM TBL_Empleados
WHERE nombre_empl LIKE 'J%'

-- inciso 14
SELECT nombre_proyec FROM TBL_Proyectos
WHERE nombre_proyec LIKE 'S%' AND LEN(nombre_proyec) <= 5 

-- inciso 15
SELECT codigo_empl, nombre_empl FROM TBL_Empleados E 
WHERE num_proy is null

-- inciso 16
SELECT codigo_proyec, nombre_proyec, precio FROM TBL_Proyectos
WHERE precio > ALL (SELECT SUM(sueldo) FROM TBL_Empleados 
GROUP BY num_proy)

-- inciso 17
SELECT codigo_empl, nombre_empl FROM TBL_Empleados
WHERE codigo_empl in(SELECT codigo_empl FROM TBL_Proyectos)

-- inciso 18
SELECT nombre_empl, sueldo FROM TBL_Empleados
ORDER BY sueldo ASC, nombre_empl ASC

-- inciso 19
SELECT AVG(sueldo) FROM TBL_Empleados
GROUP BY(nombre_dep)

-- inciso 20
SELECT num_proy, sum(sueldo) FROM TBL_Empleados
GROUP BY(num_proy)
HAVING sum(sueldo) > 180000


-- inciso 21
SELECT C.nif, P.codigo_proyec, P.precio FROM TBL_Clientes C inner join
TBL_Proyectos P on C.codigo_cli  = P.codigo_cliente
WHERE C.codigo_cli = 20

-- inciso 22
SELECT E.codigo_empl, E.nombre_empl FROM TBL_Empleados E inner join TBL_Departamentos D
on E.nombre_dep = D.nombre_dep
where D.telefono = '977333852'

-- inciso 23
SELECT nombre_cli FROM TBL_Clientes
WHERE codigo_cli not in(SELECT codigo_cliente FROM TBL_Proyectos
GROUP BY codigo_cliente)

-- inciso 24
CREATE PROCEDURE sDepartamentos
    @nombre_proyec VARCHAR(20)
AS SELECT D.nombre_dep, D.ciudad_dep, D.telefono FROM TBL_Departamentos D inner join TBL_Empleados E
on D.nombre_dep = E.nombre_dep INNER JOIN TBL_Proyectos P on E.num_proy = P.codigo_proyec
where P.nombre_proyec = @nombre_proyec

