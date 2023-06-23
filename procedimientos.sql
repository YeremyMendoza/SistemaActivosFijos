use AAF;
exec sp_columns 'inventario'
----------------------------------------
--PROCEDIMIENTOS INVENTARIO
----------------------------------------
CREATE PROCEDURE EliminarInventario
	@inventarioNo varchar(45)
as
begin
	DELETE FROM INVENTARIO WHERE INV_NO = @inventarioNo
end
go
CREATE PROCEDURE EditarInventario
	@inventarioNo varchar(45),
	@auxiliar varchar(100),
	@codEntidad varchar(50),
	@codAnterior varchar(50),
	@serie varchar(100),
	@descripcion varchar(300),
	@estado varchar(25),
	@especifica varchar(50),
	@procedencia varchar(45),
	@fechaIngreso datetime,
	@observaciones varchar(300),
	@partidaNo varchar(45),
	@empleadoNo varchar(45),
	@oficinaNo varchar(45)
as
begin
	UPDATE INVENTARIO 
	SET auxiliar = @auxiliar,
	cod_entidad = @codEntidad,
	cod_antiguo = @codAnterior,
	serie = @serie,
	descripcion = @descripcion,
	estado = @estado,
	especifica = @especifica,
	procedencia = @procedencia,
	fecha_ingreso = @fechaIngreso,
	observaciones = @observaciones,
	partida_partida_no = @partidaNo,
	empleado_emp_no = @empleadoNo,
	oficina_oficina_no = @oficinaNo
	WHERE inv_no = @inventarioNo
end
go

CREATE PROCEDURE RegistrarInvetario
	@inventarioNo varchar(45),
	@auxiliar varchar(100),
	@codEntidad varchar(50),
	@codAnterior varchar(50),
	@serie varchar(100),
	@descripcion varchar(300),
	@estado varchar(25),
	@especifica varchar(50),
	@procedencia varchar(45),
	@fechaIngreso datetime,
	@observaciones varchar(300),
	@partidaNo varchar(45),
	@empleadoNo varchar(45),
	@oficinaNo varchar(45)
as
begin
	INSERT INTO INVENTARIO VALUES (
	CONCAT('AF-', @inventarioNo),
	@auxiliar,
	@codEntidad,
	@codAnterior,
	@serie,
	@descripcion,
	@estado,
	@especifica,
	@procedencia,
	@fechaIngreso,
	@observaciones,
	@partidaNo,
	@empleadoNo,
	@oficinaNo
	)
end
go
----------------------------------------
--PROCEDIMIENTOS PARTIDA
----------------------------------------
CREATE PROCEDURE EliminarPartida
	@partidaNo varchar(45)
as
begin
	DELETE FROM PARTIDA WHERE PARTIDA_NO = @partidaNo
end
go

alter PROCEDURE EditarPartida
	@partidaNo varchar(45),
	@nombre varchar(150),
	@partida int,
	@vidaUtil decimal(10,2),
	@coeficiente decimal(10,2),
	@depreciacion varchar(45),
	@actualiza varchar(45),
	@usuarioNo varchar(45)
as
begin
	UPDATE PARTIDA 
	SET 
	NOMBRE = @nombre,
	PARTIDA = @partida,
	VIDA_UTIL = @vidaUtil,
	COEFICIENTE = @coeficiente,
	DEPRECIACION = @depreciacion,
	ACTUALIZA = @actualiza,
	USUARIO_USUARIO_NO = @usuarioNo
	WHERE PARTIDA_NO = @partidaNo
end
go

EXEC RegistrarPartida 'PART-01', 'MUEBLES Y ENSERES DE OFICINA', 43110, 10, 10, 'T', 'T', 'USU-01'
CREATE PROCEDURE RegistrarPartida
	@partidaNo varchar(45),
	@nombre varchar(150),
	@partida int,
	@vidaUtil decimal(10,2),
	@coeficiente decimal(10,2),
	@depreciacion varchar(45),
	@actualiza varchar(45),
	@usuarioNo varchar(45)
as
begin
	INSERT INTO PARTIDA VALUES (
	CONCAT('PART-', @partidaNo),
	@nombre,
	@partida,
	@vidaUtil,
	@coeficiente,
	@depreciacion,
	@actualiza,
	@usuarioNo
	)
end
go
----------------------------------------
--PROCEDIMIENTOS EMPLEADO
----------------------------------------
use aaf
CREATE PROCEDURE EliminarEmpleado
	@empleadoNo varchar(45)
as
begin
	DELETE FROM EMPLEADO WHERE EMP_NO = @empleadoNo
end
go
CREATE PROCEDURE RegistrarEmpleado
	@empleadoNo varchar(45),
	@ci varchar(20),
	@exp varchar(10),
	@nombre varchar(100),
	@cargo varchar(100),
	@unidad varchar(50),
	@areaTrabajo varchar(55),
	@celular varchar(10),
	@profesion varchar(100),
	@usuarioNo varchar(45),
	@oficinaNo varchar(45)
as
begin
	INSERT INTO EMPLEADO VALUES (
	CONCAT('E-', @empleadoNo),
	@ci,
	@exp,
	@nombre,
	@cargo,
	@unidad,
	@areaTrabajo,
	@celular,
	@profesion,
	@usuarioNo,
	@oficinaNo
	)
end
go
CREATE PROCEDURE EditarEmpleado
	@empleadoNo varchar(45),
	@ci varchar(20),
	@exp varchar(10),
	@nombre varchar(100),
	@cargo varchar(100),
	@unidad varchar(50),
	@areaTrabajo varchar(55),
	@celular varchar(10),
	@profesion varchar(100),
	@usuarioNo varchar(45),
	@oficinaNo varchar(45)
as
begin
	UPDATE EMPLEADO 
	SET
	CI = @ci,
	EXP = @exp,
	NOMBRE = @nombre,
	CARGO = @cargo,
	UNIDAD = @unidad,
	AREA_TRAB = @areaTrabajo,
	CELULAR = @celular,
	PROFESION = @profesion,
	USUARIO_USUARIO_NO = @usuarioNo,
	OFICINA_OFICINA_NO = @oficinaNo
	WHERE EMP_NO = @empleadoNo
end
go
----------------------------------------
--PROCEDIMIENTOS OFICINA
----------------------------------------
CREATE PROCEDURE RegistrarOficina
	@oficinaNo varchar(45),
	@departamento varchar(45),
	@oficinaCod varchar(15),
	@nombreOficina varchar(100),
	@ubicacion varchar(255),
	@empleadoNo varchar(45)
as
begin
	INSERT INTO OFICINA VALUES(
	CONCAT('OF-', @oficinaNo),
	@departamento,
	@oficinaCod,
	@nombreOficina,
	@ubicacion,
	@empleadoNo
	)
END
GO
alter PROCEDURE EditarOficina
	@oficinaNo varchar(45),
	@departamento varchar(45),
	@oficinaCod varchar(15),
	@nombreOficina varchar(100),
	@ubicacion varchar(255),
	@empleadoNo varchar(45)
as
begin
	UPDATE OFICINA 
	SET
	DEPTO = @departamento,
	COD_OFICINA = @oficinaCod,
	NOMBRE_OF = @nombreOficina,
	UBICACION = @ubicacion,
	EMPLEADO_EMP_NO = @empleadoNo
	WHERE OFICINA_NO = @oficinaNo
END
GO
CREATE PROCEDURE EliminarOficina
	@oficinaNo varchar(45)
as
begin
	DELETE FROM oficina WHERE OFICINA_NO = @oficinaNo
END
GO
----------------------------------------
--PROCEDIMIENTOS USUARIO
----------------------------------------
CREATE PROCEDURE EditarUsuario
	@usuario_no varchar(45)
as
begin
	delete from usuario WHERE USUARIO_NO = @usuario_no
end 
go
CREATE PROCEDURE EditarUsuario
	@usuario_no varchar(45),
	@ci varchar(20),
	@nombre varchar(50),
	@paterno varchar(50),
	@materno varchar(50),
	@cargo varchar(100),
	@profesion varchar(100),
	@usuario varchar(45),
	@password nvarchar(100)
as
begin
	UPDATE usuario 
	SET
	CI = @ci,
	NOMBRE = @nombre,
	PATERNO = @paterno,
	MATERNO = @materno,
	CARGO = @cargo,
	PROFESION = @profesion,
	USUARIO = @usuario,
	PASSWORD = ENCRYPTBYPASSPHRASE('ITSU6E7_u62ñ', @password)
	WHERE USUARIO_NO = @usuario_no
end 
go
CREATE PROCEDURE RegistrarUsuario
	@usuario_no varchar(45),
	@ci varchar(20),
	@nombre varchar(50),
	@paterno varchar(50),
	@materno varchar(50),
	@cargo varchar(100),
	@profesion varchar(100),
	@usuario varchar(45),
	@password nvarchar(100)
as
begin
	insert into usuario values 
	(
	CONCAT('USU-',@usuario_no),
	@ci,
	@nombre,
	@paterno,
	@materno,
	@cargo,
	@profesion,
	@usuario,
	ENCRYPTBYPASSPHRASE('ITSU6E7_u62ñ', @password)
)
end 
go

exec RegistrarUsuario 
	'01',
	'6099553','WILLIAM',
	'ROQUE','ROQUE',
	'JEFE ADMINISTRACION Y FINANZAS','INGENIERO DE SISTEMAS',
	'WROQUE','6099553'
select * from usuario where usuario = 'WROQUE' and convert(nvarchar(max), decryptByPassPhrase('ITSU6E7_u62ñ', PASSWORD)) = '6099553';
use aaf;

select * from oficina;
SELECT* FROM EMPLEADO
SELECT * FROM PARTIDA;
select * from inventario