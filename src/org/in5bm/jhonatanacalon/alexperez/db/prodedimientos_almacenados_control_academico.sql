USE db_control_academico_in5bm;

-- CRUD entidad alumnos----------------------------------------------------------------------------------------------------------------
-- CREATE alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_create $$
CREATE PROCEDURE sp_alumnos_create(
	IN _carne VARCHAR(7),
    IN _nombre1 VARCHAR(15),
    IN _nombre2 VARCHAR(15),
    IN _nombre3 VARCHAR(15),
    IN _apellido1 VARCHAR(15),
    IN _apellido2 VARCHAR(15)
)
BEGIN
	INSERT INTO alumnos(
		carne,
        nombre1,
        nombre2,
        nombre3,
        apellido1,
        apellido2
    )
	VALUES
	(
		_carne,
		_nombre1,
		_nombre2,
		_nombre3,
		_apellido1,
		_apellido2
    );
END $$
DELIMITER ;

-- READ alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_read $$
CREATE PROCEDURE sp_alumnos_read()
BEGIN
	SELECT
		alumnos.carne,
        alumnos.nombre1,
        alumnos.nombre2,
        alumnos.nombre3,
        alumnos.apellido1,
        alumnos.apellido2
	FROM
		alumnos;
END $$
DELIMITER ;

-- READ alumnos(ID)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_read_by_id $$
CREATE PROCEDURE sp_alumnos_read_by_id(
	IN _carne VARCHAR(7)
)
BEGIN
	SELECT 
		alumnos.carne,
        alumnos.nombre1,
        alumnos.nombre2,
        alumnos.nombre3,
        alumnos.apellido1,
        alumnos.apellido2    
    FROM
		alumnos
	WHERE
		alumnos.carne=_carne;
END $$
DELIMITER ;

-- UPDATE alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_update $$
CREATE PROCEDURE sp_alumnos_update(
	IN _carne VARCHAR(7),
    IN _nombre1 VARCHAR(15),
    IN _nombre2 VARCHAR(15),
    IN _nombre3 VARCHAR(15),
    IN _apellido1 VARCHAR(15),
    IN _apellido2 VARCHAR(15)
)
BEGIN
	UPDATE 
		alumnos
    SET 
		alumnos.nombre1=_nombre1,
        alumnos.nombre2=_nombre2,
        alumnos.nombre3=_nombre3,
        alumnos.apellido1=_apellido1,
        alumnos.apellido2=_apellido2
	WHERE
		alumnos.carne=_carne;
END $$
DELIMITER ;

-- DELETE alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_delete $$
CREATE PROCEDURE sp_alumnos_delete(
	IN _carne VARCHAR(7)
)
BEGIN
	DELETE FROM
		alumnos
	WHERE
		alumnos.carne=_carne;
END $$
DELIMITER ;

-- REPORT alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_report $$
CREATE PROCEDURE sp_alumnos_report()
BEGIN
	SELECT
		alumnos.carne,
        CONCAT(
			alumnos.nombre1, " ",
			IF(alumnos.nombre2 IS NULL, "", alumnos.nombre2), " ",
            IF(alumnos.nombre3 IS NULL, "", alumnos.nombre3), " ",
			alumnos.apellido1, " ",
            IF(alumnos.apellido2 IS NULL,"", alumnos.apellido2)
        ) AS nombre_completo
	FROM alumnos;
END $$
DELIMITER ;

-- CRUD entidad instructores----------------------------------------------------------------------------------------------------------------
-- CREATE instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_create $$
CREATE PROCEDURE sp_instructores_create(
	IN _nombre1 VARCHAR(15),
    IN _nombre2 VARCHAR(15),
    IN _nombre3 VARCHAR(15),
    IN _apellido1 VARCHAR(15),
	IN _apellido2 VARCHAR(15),
    IN _direccion VARCHAR(45),
    IN _email VARCHAR(45),
    IN _telefono VARCHAR(8),
    IN _fecha_nacimiento DATE
)
BEGIN
	INSERT INTO instructores(
		nombre1,
        nombre2,
        nombre3,
        apellido1,
        apellido2,
        direccion,
        email,
        telefono,
        fecha_nacimiento
    )
    VALUES
    (
		_nombre1,
        _nombre2,
        _nombre3,
        _apellido1,
        _apellido2,
        _direccion,
        _email,
        _telefono,
        _fecha_nacimiento
    );
END $$
DELIMITER ;

-- READ instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_read $$
CREATE PROCEDURE sp_instructores_read()
BEGIN
	SELECT
		instructores.id,
        instructores.nombre1,
        instructores.nombre2,
        instructores.nombre3,
        instructores.apellido1,
        instructores.apellido2,
        instructores.direccion,
        instructores.email,
        instructores.telefono,
        instructores.fecha_nacimiento
	FROM
		instructores;
END $$
DELIMITER ;

-- READ instructores(ID)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_read_by_id $$
CREATE PROCEDURE sp_instructores_read_by_id(
	IN _id INT
)
BEGIN
	SELECT 
		instructores.id,
        instructores.nombre1,
        instructores.nombre2,
        instructores.nombre3,
        instructores.apellido1,
        instructores.apellido2,
        instructores.direccion,
        instructores.email,
        instructores.telefono,
        instructores.fecha_nacimiento
    FROM
		instructores
	WHERE
		instructores.id=_id;
END $$
DELIMITER ;

-- UPDATE instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_update $$
CREATE PROCEDURE sp_instructores_update(
	IN _id INT,
	IN _nombre1 VARCHAR(15),
	IN _nombre2 VARCHAR(15),
   	IN _nombre3 VARCHAR(15),
   	IN _apellido1 VARCHAR(15),
	IN _apellido2 VARCHAR(15),
    IN _direccion VARCHAR(45),
    IN _email VARCHAR(45),
    IN _telefono VARCHAR(8),
    IN _fecha_nacimiento DATE	
)
BEGIN
	UPDATE
		instructores
	SET
		instructores.nombre1=_nombre1,
        instructores.nombre2=_nombre2,
        instructores.nombre3=_nombre3,
        instructores.apellido1=_apellido1,
        instructores.apellido2=_apellido2,
        instructores.direccion=_direccion,
        instructores.email=_email,
        instructores.telefono=_telefono,
        instructores.fecha_nacimiento=_fecha_nacimiento
	WHERE
		instructores.id=_id;
END $$
DELIMITER ;

-- DELETE instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_delete $$
CREATE PROCEDURE sp_instructores_delete(
	IN _id INT
)
BEGIN
	DELETE FROM
		instructores
	WHERE
		instructores.id=_id;
END $$
DELIMITER ;

-- REPORT instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_report $$
CREATE PROCEDURE sp_instructores_report()
BEGIN
	SELECT
		instructores.id,
        CONCAT(
			instructores.nombre1, " ",
			IF(instructores.nombre2 IS NULL, "", instructores.nombre2), " ",
            IF(instructores.nombre3 IS NULL, "", instructores.nombre3), " ",
			instructores.apellido1, " ",
            IF(instructores.apellido2 IS NULL,"", instructores.apellido2)
        ) AS nombre_completo,
        IF(instructores.direccion IS NULL,"", instructores.direccion) AS direccion,
        instructores.email,
        instructores.telefono,
        iF(instructores.fecha_nacimiento IS NULL,"",instructores.fecha_nacimiento) AS fecha_nacimiento
	FROM instructores;
END $$
DELIMITER ;

-- CRUD entidad salones----------------------------------------------------------------------------------------------------------------
-- CREATE salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_create $$
CREATE PROCEDURE sp_salones_create(
	IN _codigo_salon VARCHAR(5),
    IN _descripcion VARCHAR(45),
    IN _capacidad_maxima INT,
    IN _edificio VARCHAR(15),
    IN _nivel INT
)
BEGIN
	INSERT INTO salones(
		codigo_salon,
        descripcion,
        capacidad_maxima,
        edificio,
        nivel
    ) 
    VALUES
    (
		_codigo_salon,
        _descripcion,
        _capacidad_maxima,
        _edificio,
        _nivel
    );
END $$
DELIMITER ;

-- READ salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_read $$
CREATE PROCEDURE sp_salones_read()
BEGIN
	SELECT
		salones.codigo_salon,
        salones.descripcion,
		salones.capacidad_maxima,
        salones.edificio,
        salones.nivel
	FROM
		salones;
END $$
DELIMITER ;

-- READ salones (ID)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_read_by_id $$
CREATE PROCEDURE sp_salones_read_by_id(
	IN _codigo_salon VARCHAR(5)
)
BEGIN
	SELECT
		salones.codigo_salon,
        salones.descripcion,
		salones.capacidad_maxima,
        salones.edificio,
        salones.nivel
	FROM
		salones
	WHERE
		salones.codigo_salon=_codigo_salon;
END $$
DELIMITER ;

-- UPDATE salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_update $$
CREATE PROCEDURE sp_salones_update(
	IN _codigo_salon VARCHAR(5),
    IN _descripcion VARCHAR(45),
    IN _capacidad_maxima INT,
    IN _edificio VARCHAR(15),
    IN _nivel INT
)
BEGIN
	UPDATE
		salones
	SET
        salones.descripcion=_descripcion,
        salones.capacidad_maxima=_capacidad_maxima,
        salones.edificio=_edificio,
        salones.nivel=_nivel
	WHERE
		salones.codigo_salon=_codigo_salon;
END $$
DELIMITER ;

-- DELETE salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_delete $$
CREATE PROCEDURE sp_salones_delete(
	IN _codigo_salon VARCHAR(5)
)
BEGIN
	DELETE FROM
		salones
	WHERE
		salones.codigo_salon=_codigo_salon;
END $$
DELIMITER ;

-- REPORT salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_report $$
CREATE PROCEDURE sp_salones_report()
BEGIN
	SELECT
		salones.codigo_salon,
        IF(salones.descripcion IS NULL, "", salones.descripcion) AS descripcion,
        salones.capacidad_maxima,
        IF(salones.edificio IS NULL, "", salones.edificio) AS edificio,
        IF(salones.nivel IS NULL, 0, salones.nivel) AS nivel
	FROM salones;
END $$
DELIMITER ;

-- CRUD entidad carreras_tecnicas----------------------------------------------------------------------------------------------------------------
-- CREATE carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_create $$
CREATE PROCEDURE sp_carreras_tecnicas_create(
	IN _codigo_tecnico VARCHAR(6),
    IN _carrera VARCHAR(45),
    IN _grado VARCHAR(10),
    IN _seccion CHAR(1),
    IN _jornada VARCHAR(10)
)
BEGIN 
	INSERT INTO carreras_tecnicas(
		codigo_tecnico,
		carrera,
        grado,
        seccion,
        jornada
    )
	VALUES
    (
		_codigo_tecnico,
		_carrera,
      	_grado,
        _seccion,
        _jornada
    );
END $$
DELIMITER ;

-- READ carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_read $$
CREATE PROCEDURE sp_carreras_tecnicas_read()
BEGIN
	SELECT
		carreras_tecnicas.codigo_tecnico,
        carreras_tecnicas.carrera,
       	carreras_tecnicas.grado,
        carreras_tecnicas.seccion,
        carreras_tecnicas.jornada
	FROM
		carreras_tecnicas;	
END $$
DELIMITER ;

-- READ carreras_tecnicas (ID)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_read_by_id $$
CREATE PROCEDURE sp_carreras_tecnicas_read_by_id(
	IN _codigo_tecnico VARCHAR(6)
)
BEGIN
	SELECT
		carreras_tecnicas.codigo_tecnico,
        carreras_tecnicas.carrera,
       	carreras_tecnicas.grado,
        carreras_tecnicas.seccion,
        carreras_tecnicas.jornada
	FROM
		carreras_tecnicas
	WHERE
		carreras_tecnicas.codigo_tecnico=_codigo_tecnico;
END $$
DELIMITER ;

-- UPDATE carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_update $$
CREATE PROCEDURE sp_carreras_tecnicas_update(
	IN _codigo_tecnico VARCHAR(6),
    IN _carrera VARCHAR(45),
    IN _grado VARCHAR(10),
    IN _seccion CHAR(1),
    IN _jornada VARCHAR(10)
)
BEGIN
	UPDATE
		carreras_tecnicas
	SET
		carreras_tecnicas.carrera=_carrera,
        carreras_tecnicas.grado=_grado,
        carreras_tecnicas.seccion=_seccion,
        carreras_tecnicas.jornada=_jornada
	WHERE
		carreras_tecnicas.codigo_tecnico=_codigo_tecnico;
END $$
DELIMITER ;

-- DELETE carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_delete $$
CREATE PROCEDURE sp_carreras_tecnicas_delete(
	IN _codigo_tecnico VARCHAR(6)
)
BEGIN
	DELETE FROM
		carreras_tecnicas
	WHERE
		carreras_tecnicas.codigo_tecnico=_codigo_tecnico;	
END $$
DELIMITER ;

-- REPORT carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_report $$
CREATE PROCEDURE sp_carreras_tecnicas_report()
BEGIN
	SELECT
		carreras_tecnicas.codigo_tecnico,
        carreras_tecnicas.carrera,
        carreras_tecnicas.grado,
        carreras_tecnicas.seccion,
        carreras_tecnicas.jornada
	FROM carreras_tecnicas;
END $$
DELIMITER ;

-- CRUD entidad horarios----------------------------------------------------------------------------------------
-- CREATE horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_create $$
CREATE PROCEDURE sp_horarios_create(
	IN _horario_inicio TIME,
	IN _horario_final TIME,
  	IN _lunes TINYINT(1),
	IN _martes TINYINT(1),
  	IN _miercoles TINYINT(1),
	IN _jueves TINYINT(1),
    IN _viernes TINYINT(1)
)
BEGIN 
	INSERT INTO horarios(
		horario_inicio,
		horario_final,
		lunes,
		martes,
		miercoles,
		jueves,
		viernes
    )
	VALUES
    (
		_horario_inicio,
    	_horario_final,
  		_lunes,
    	_martes,
  		_miercoles,
    	_jueves,
    	_viernes
	);
END $$
DELIMITER ;

-- READ horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_read $$
CREATE PROCEDURE sp_horarios_read()
BEGIN
	SELECT
		horarios.id,
		horarios.horario_inicio,
		horarios.horario_final,
		horarios.lunes,
		horarios.martes,
		horarios.miercoles,
		horarios.jueves,
		horarios.viernes
	FROM
		horarios;
END $$
DELIMITER ;

-- READ horarios (ID)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_read_by_id $$
CREATE PROCEDURE sp_horarios_read_by_id(
	IN _id INT
)
BEGIN
	SELECT
		horarios.id,
		horarios.horario_inicio,
		horarios.horario_final,
		horarios.lunes,
		horarios.martes,
		horarios.miercoles,
		horarios.jueves,
		horarios.viernes
	FROM
		horarios
	WHERE
		horarios.id=_id;
END $$
DELIMITER ;

-- UPDATE horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_update $$
CREATE PROCEDURE sp_horarios_update(
	IN _id INT,
	IN _horario_inicio TIME,
	IN _horario_final TIME,
  	IN _lunes TINYINT(1),
	IN _martes TINYINT(1),
  	IN _miercoles TINYINT(1),
	IN _jueves TINYINT(1),
    IN _viernes TINYINT(1)
)
BEGIN
	UPDATE
		horarios
	SET
		horarios.horario_inicio=_horario_inicio,
		horarios.horario_final=_horario_final,
		horarios.lunes=_lunes,
		horarios.martes=_martes,
		horarios.miercoles=_miercoles,
		horarios.jueves=_jueves,
		horarios.viernes=_viernes
	WHERE
		horarios.id=_id;
END $$

-- DELETE horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_delete $$
CREATE PROCEDURE sp_horarios_delete(
	IN _id INT
)
BEGIN
	DELETE FROM
		horarios
	WHERE
		horarios.id=_id;
END $$
DELIMITER ;

-- REPORT horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_report $$
CREATE PROCEDURE sp_horarios_report()
BEGIN
	SELECT
		horarios.id,
        horarios.horario_inicio,
        horarios.horario_final,
        IF(horarios.lunes IS TRUE , "Aplica", "No Aplica") AS lunes,
        IF(horarios.martes IS TRUE , "Aplica", "No Aplica") AS martes,
        IF(horarios.miercoles IS TRUE , "Aplica", "No Aplica") AS miercoles,
        IF(horarios.jueves IS TRUE , "Aplica", "No Aplica") AS jueves,
        IF(horarios.viernes IS TRUE , "Aplica", "No Aplica") AS viernes
	FROM horarios;
END $$
DELIMITER ;

-- CRUD entidad cursos----------------------------------------------------------------------------------------
-- CREATE cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_create $$
CREATE PROCEDURE sp_cursos_create(
	IN _nombre_curso VARCHAR(255),
	IN _ciclo YEAR,
  	IN _cupo_maximo INT,   
	IN _cupo_minimo INT,
	IN _carrera_tecnica_id VARCHAR(128),
	IN _horario_id INT,
	IN _instructor_id INT,
	IN _salon_id VARCHAR(5)
)
BEGIN 
	INSERT INTO cursos(
		nombre_curso,
		ciclo,
  		cupo_maximo,   
		cupo_minimo,
		carrera_tecnica_id,
		horario_id,
		instructor_id,
		salon_id
	)
	VALUES
    (
		_nombre_curso,
    	_ciclo,
  		_cupo_maximo,
		_cupo_minimo,
		_carrera_tecnica_id,
		_horario_id,
		_instructor_id,
		_salon_id
	);
END $$
DELIMITER ;

-- READ cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_read $$
CREATE PROCEDURE sp_cursos_read()
BEGIN
	SELECT
		cursos.id,
		cursos.nombre_curso,
		cursos.ciclo,
  		cursos.cupo_maximo,   
		cursos.cupo_minimo,
		cursos.carrera_tecnica_id,
		cursos.horario_id,
		cursos.instructor_id,
		cursos.salon_id
	FROM
		cursos;
END $$
DELIMITER ;

-- READ cursos(ID)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_read_by_id $$
CREATE PROCEDURE sp_cursos_read_by_id(
	IN _id INT
)
BEGIN
	SELECT
		cursos.id,
		cursos.nombre_curso,
		cursos.ciclo,
  		cursos.cupo_maximo,   
		cursos.cupo_minimo,
		cursos.carrera_tecnica_id,
		cursos.horario_id,
		cursos.instructor_id,
		cursos.salon_id
	FROM
		cursos
	WHERE
		cursos.id=_id;
END $$
DELIMITER ;

-- UPDATE cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_update $$
CREATE PROCEDURE sp_cursos_update(
	IN _id INT,
	IN _nombre_curso VARCHAR(255),
	IN _ciclo YEAR,
  	IN _cupo_maximo INT,   
	IN _cupo_minimo INT,
	IN _carrera_tecnica_id VARCHAR(128),
	IN _horario_id INT,
	IN _instructor_id INT,
	IN _salon_id VARCHAR(5)
)
BEGIN
	UPDATE
		cursos
	SET
		cursos.nombre_curso=_nombre_curso,
		cursos.ciclo=_ciclo,
  		cursos.cupo_maximo=_cupo_maximo,
		cursos.cupo_minimo=_cupo_minimo,
		cursos.carrera_tecnica_id=_carrera_tecnica_id,
		cursos.horario_id=_horario_id,
		cursos.instructor_id=_instructor_id,
		cursos.salon_id=_salon_id
	WHERE
		cursos.id=_id;	 
END $$

-- DELETE cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_delete $$
CREATE PROCEDURE sp_cursos_delete(
	IN _id INT
)
BEGIN
	DELETE FROM
		cursos
	WHERE
		cursos.id=_id;	
END $$
DELIMITER ;

-- REPORT cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_report $$
CREATE PROCEDURE sp_cursos_report()
BEGIN
	SELECT
		cursos.id,
		cursos.nombre_curso,
        IF(cursos.ciclo IS NULL, "", cursos.ciclo) AS ciclo,
  		IF(cursos.cupo_maximo IS NULL, "", cursos.cupo_maximo) AS cupo_maximo,
		IF(cursos.cupo_minimo IS NULL, "", cursos.cupo_minimo) AS cupo_minimo,
		cursos.carrera_tecnica_id,
        carreras_tecnicas.carrera,
		cursos.horario_id,
        horarios.horario_inicio,
        horarios.horario_final,
		cursos.instructor_id,
        CONCAT(
			instructores.nombre1, " ",
			instructores.apellido1
        ) AS nombre_completo,
		cursos.salon_id,
        IF(salones.descripcion IS NULL, "", salones.descripcion) AS descripcion
	FROM
		cursos
	INNER JOIN 
		carreras_tecnicas
    INNER JOIN
		horarios
	INNER JOIN
		instructores
	INNER JOIN
		salones
	ON
		cursos.carrera_tecnica_id=carreras_tecnicas.codigo_tecnico 
        AND cursos.horario_id=horarios.id AND cursos.instructor_id=instructores.id
        AND cursos.salon_id=salones.codigo_salon;
END $$
DELIMITER ;

-- REPORT BY ID cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_report_by_id $$
CREATE PROCEDURE sp_cursos_report_by_id(
	IN _id INT
)
BEGIN
	SELECT
		cursos.id,
		cursos.nombre_curso,
        IF(cursos.ciclo IS NULL, "", cursos.ciclo) AS ciclo,
  		IF(cursos.cupo_maximo IS NULL, "", cursos.cupo_maximo) AS cupo_maximo,
		IF(cursos.cupo_minimo IS NULL, "", cursos.cupo_minimo) AS cupo_minimo,
		cursos.carrera_tecnica_id,
        carreras_tecnicas.carrera,
		cursos.horario_id,
        horarios.horario_inicio,
        horarios.horario_final,
		cursos.instructor_id,
        CONCAT(
			instructores.nombre1, " ",
			instructores.apellido1
        ) AS nombre_completo,
		cursos.salon_id,
        IF(salones.descripcion IS NULL, "", salones.descripcion) AS descripcion
	FROM
		cursos
	INNER JOIN 
		carreras_tecnicas
    INNER JOIN
		horarios
	INNER JOIN
		instructores
	INNER JOIN
		salones
	ON
		cursos.carrera_tecnica_id=carreras_tecnicas.codigo_tecnico 
        AND cursos.horario_id=horarios.id AND cursos.instructor_id=instructores.id
        AND cursos.salon_id=salones.codigo_salon
	WHERE 
		cursos.id=_id;
END $$
DELIMITER ;

-- CRUD entidad asignaciones_alumnos----------------------------------------------------------------------------------------
-- CREATE asignaciones_alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_create $$
CREATE PROCEDURE sp_asignaciones_alumnos_create(
	IN _alumno_id VARCHAR(7),
	IN _curso_id INT,
  	IN _fecha_asignacion DATETIME
)
BEGIN 
	INSERT INTO asignaciones_alumnos(
		alumno_id,
		curso_id,
		fecha_asignacion
	)
	VALUES
    (
		_alumno_id,
		_curso_id,
  		_fecha_asignacion
	);
END $$
DELIMITER ;

-- READ asignaciones_alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_read $$
CREATE PROCEDURE sp_asignaciones_alumnos_read()
BEGIN
	SELECT
		asignaciones_alumnos.id,
		asignaciones_alumnos.alumno_id,
		asignaciones_alumnos.curso_id,
		asignaciones_alumnos.fecha_asignacion
	FROM
		asignaciones_alumnos;
END $$
DELIMITER ;

-- READ asignaciones_alumnos(ID)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_read_by_id $$
CREATE PROCEDURE sp_asignaciones_alumnos_read_by_id(
	IN _id INT
)
BEGIN
	SELECT
		asignaciones_alumnos.id,
		asignaciones_alumnos.alumno_id,
		asignaciones_alumnos.curso_id,
		asignaciones_alumnos.fecha_asignacion
	FROM
		asignaciones_alumnos
	WHERE
		asignaciones_alumnos.id=_id;
END $$
DELIMITER ;

-- UPDATE asignaciones_alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_update $$
CREATE PROCEDURE sp_asignaciones_alumnos_update(
	IN _id INT,
    IN _alumno_id VARCHAR(7),
    IN _curso_id INT,
  	IN _fecha_asignacion DATETIME
)
BEGIN
	UPDATE
		asignaciones_alumnos
	SET
		asignaciones_alumnos.alumno_id=_alumno_id,
		asignaciones_alumnos.curso_id=_curso_id,
		asignaciones_alumnos.fecha_asignacion=_fecha_asignacion
	WHERE
		asignaciones_alumnos.id=_id; 
END $$

-- DELETE asignaciones_alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_delete $$
CREATE PROCEDURE sp_asignaciones_alumnos_delete(
	IN _id INT
)
BEGIN
	DELETE FROM
		asignaciones_alumnos
	WHERE
		asignaciones_alumnos.id=_id;	
END$$
DELIMITER ;

-- REPORT asignaciones_alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_report $$
CREATE PROCEDURE sp_asignaciones_alumnos_report()
BEGIN
	SELECT
		asignaciones_alumnos.id,
		asignaciones_alumnos.alumno_id,
        CONCAT(
			alumnos.nombre1, " ",
			IF(alumnos.nombre2 IS NULL, "", alumnos.nombre2), " ",
            IF(alumnos.nombre3 IS NULL, "", alumnos.nombre3), " ",
			alumnos.apellido1, " ",
            IF(alumnos.apellido2 IS NULL,"", alumnos.apellido2)
        ) AS nombre_completo,
		asignaciones_alumnos.curso_id,
        cursos.nombre_curso,
		asignaciones_alumnos.fecha_asignacion
	FROM
		asignaciones_alumnos
	INNER JOIN 
		alumnos
    INNER JOIN 
		cursos
	ON
		asignaciones_alumnos.alumno_id=alumnos.carne 
        AND asignaciones_alumnos.curso_id=cursos.id;
END $$
DELIMITER ;

-- REPORT BY ID asignaciones_alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_report_by_id $$
CREATE PROCEDURE sp_asignaciones_alumnos_report_by_id(
	IN _id INT
)
BEGIN
	SELECT
		asignaciones_alumnos.id,
		asignaciones_alumnos.alumno_id,
        CONCAT(
			alumnos.nombre1, " ",
			IF(alumnos.nombre2 IS NULL, "", alumnos.nombre2), " ",
            IF(alumnos.nombre3 IS NULL, "", alumnos.nombre3), " ",
			alumnos.apellido1, " ",
            IF(alumnos.apellido2 IS NULL,"", alumnos.apellido2)
        ) AS nombre_completo,
		asignaciones_alumnos.curso_id,
        cursos.nombre_curso,
		asignaciones_alumnos.fecha_asignacion
	FROM
		asignaciones_alumnos
	INNER JOIN 
		alumnos
    INNER JOIN 
		cursos
	ON
		asignaciones_alumnos.alumno_id=alumnos.carne 
        AND asignaciones_alumnos.curso_id=cursos.id
	WHERE
		asignaciones_alumnos.id=_id;
END $$
DELIMITER ;