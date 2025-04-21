CREATE DATABASE assenta_db;

SET search_path TO assenta_db;

CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    dpi_empleado VARCHAR(13) NOT NULL,
    sexo_empleado VARCHAR(50) NOT NULL,
    estado_civil VARCHAR(1) NOT NULL,  -- C=Casado, S=Soltero
    nombre1_empleado VARCHAR(50) NOT NULL,
    nombre2_empleado VARCHAR(50),
    nombre3_empleado VARCHAR(50),
    apellido1_empleado VARCHAR(50) NOT NULL,
    apellido2_empleado VARCHAR(50),
    apellidocasada_empleado VARCHAR(50),
    fec_nacimiento DATE NOT NULL,  -- Formato ISO
    edad_empleado INT NOT NULL,
    puesto_id INT NOT NULL,
    email_empleado VARCHAR(100),
    telefono1_empleado VARCHAR(15) NOT NULL,
    telefono2_empleado VARCHAR(15),
    horario_entrada TIME NOT NULL,
    horario_salida TIME NOT NULL,
    jefe_inmediato_id INT,  -- Nueva columna para el jefe
    CONSTRAINT fk_empleado_puesto FOREIGN KEY (puesto_id) REFERENCES puesto(id_puesto),
    CONSTRAINT fk_jefe_inmediato FOREIGN KEY (jefe_inmediato_id) REFERENCES empleado(id_empleado)  -- Relación recursiva
);

CREATE TABLE puesto( --SOLO PUEDE TENER UN PUESTO
    id_puesto SERIAL PRIMARY KEY ,
    nombre_puesto VARCHAR(50) NOT NULL UNIQUE,
    desc_puesto VARCHAR(200) NOT NULL
);

CREATE TABLE direccion_empleado( --SOLO UNA DIRECCIÓN DE CONTACTO
    empleado_id INT NOT NULL PRIMARY KEY ,
    departamento VARCHAR(50) NOT NULL,
    municipio VARCHAR(50) NOT NULL ,
    aldea VARCHAR(50),
    direccion VARCHAR(100),
    CONSTRAINT fk_empleado_direcccion FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado)
);

CREATE TABLE usuarios(
    id_usuario SERIAL PRIMARY KEY,
    usuario VARCHAR(15),
    password VARCHAR(50) NOT NULL
);

CREATE TABLE huella(
    id_relacion_huellas SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    huella BYTEA not null,
    CONSTRAINT fk_huella_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado)
);