CREATE DATABASE assenta_db;

SET search_path TO assenta_db;

CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    sexo_empleado VARCHAR(50) NOT NULL,
    estado_civil VARCHAR(1) NOT NULL,  -- C=Casado, S=Soltero
    nombre1_empleado VARCHAR(50) NOT NULL,
    nombre2_empleado VARCHAR(50) NOT NULL,
    nombre3_empleado VARCHAR(50) NOT NULL,
    apellido1_empleado VARCHAR(50) NOT NULL,
    apellido2_empleado VARCHAR(50) NOT NULL,
    apellidocasada_empleado VARCHAR(50) NOT NULL,
    fec_nacimiento DATE NOT NULL,  -- Formato ISO
    edad_empleado INT NOT NULL,
    puesto_id INT NOT NULL,
    email_empleado VARCHAR(100),
    jefe_inmediato_id INT,  -- Nueva columna para el jefe
    CONSTRAINT fk_empleado_puesto FOREIGN KEY (puesto_id) REFERENCES puesto(id_puesto),
    CONSTRAINT fk_jefe_inmediato FOREIGN KEY (jefe_inmediato_id) REFERENCES empleado(id_empleado)  -- Relación recursiva
);


CREATE TABLE puesto(
    id_puesto serial primary key,
    nombre_puesto varchar(100) not null unique,
    desc_puesto varchar(200) not null
);

CREATE TABLE telefono_empleado(
    id_telefono_empleado serial primary key,
    empleado_id int not null,
    telefono_empleado varchar(15) not null,
    constraint fk_empleado_telefono foreign key (empleado_id) references empleado(id_empleado)
);

CREATE TABLE direccion_empleado(
    id_direccion_empleado serial primary key,
    empleado_id int not null,
    departamento varchar(50) not null,
    municipio varchar(50) not null,
    aldea varchar(50) not null,
    direccion varchar(100),
    constraint fk_empleado_direcccion foreign key (empleado_id) references empleado(id_empleado)
);

CREATE TABLE horario_empleado(
    id_horario_empleado serial primary key,
    empleado_id int not null unique,
    horario_entrada time not null,
    horario_salida time not null,
    constraint fk_empleado_horario foreign key (empleado_id) references empleado(id_empleado)
);

CREATE TABLE jornada_empleado(
    id_jornada_empleado serial primary key,
    empleado_id int not null unique,
    tipo_jornada varchar(15) not null, --Matutina, Vespertina,
    dia_inicio_jornada varchar(15) not null, --Lunes, Martes, Miercoles, Jueves, Viernes, Sábado, Domingo
    dia_fin_jornada varchar(15) not null,
    constraint fk_empleado_jornada foreign key (empleado_id) references empleado(id_empleado)
);