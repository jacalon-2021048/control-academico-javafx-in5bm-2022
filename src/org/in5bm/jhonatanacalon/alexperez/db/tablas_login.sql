USE db_control_academico_in5bm;

DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS roles;

CREATE TABLE IF NOT EXISTS roles(
	id INT NOT NULL,
	descripcion VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);
    
CREATE TABLE IF NOT EXISTS usuarios(
	user VARCHAR(25) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    rol_id INT NOT NULL,
    PRIMARY KEY (user),
    CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES roles(id)
);

INSERT INTO roles(id, descripcion) VALUES (1, "Administrador");
INSERT INTO roles(id, descripcion) VALUES (2, "Estandar");

INSERT INTO usuarios(user, pass, nombre, rol_id) VALUES("root", "admin", "Jorge Pérez", 1);
INSERT INTO usuarios(user, pass, nombre, rol_id) VALUES ("kinal", "12345", "Jhonatan Acalon", 2);
-- --------------------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_usuarios_read $$
CREATE PROCEDURE sp_usuarios_read(
	_user VARCHAR(50)
)
BEGIN
	SELECT
		usuarios.user,
        usuarios.pass,
        usuarios.nombre,
        usuarios.rol_id
	FROM
		usuarios
	WHERE
		usuarios.user=_user;
END$$
DELIMITER ;

CALL sp_usuarios_read("kinal")