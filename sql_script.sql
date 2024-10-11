-- Crear la base de datos
-- CREATE DATABASE db;
-- USE sistema_empleados;

-- Tabla de Categoría (Debe ser creada primero ya que es referenciada)
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50),
    fecha_designacion DATE,
    resolucion VARCHAR(100)
);

-- Tabla de Funciones (Debe ser creada antes de que sea referenciada)
CREATE TABLE funciones (
    id_funcion INT PRIMARY KEY AUTO_INCREMENT,
    nombre_funcion VARCHAR(100),
    descripcion_funcion TEXT
);

-- Tabla de Empleados (Registro de empleados)
CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    dni VARCHAR(15) UNIQUE,
    cuil VARCHAR(15) UNIQUE,
    fecha_nacimiento DATE,
    sexo VARCHAR(10),
    estado_civil VARCHAR(20),
    nivel_estudio VARCHAR(50),
    nacionalidad VARCHAR(50)
);

-- Tabla de Datos Laborales
CREATE TABLE datos_laborales (
    id_laboral INT PRIMARY KEY AUTO_INCREMENT,
    legajo VARCHAR(20),
    fecha_ingreso DATE,
    id_categoria INT,
    id_funcion INT,
    departamento_asignado VARCHAR(100),
    horario_trabajo VARCHAR(50),
    turno VARCHAR(20),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_funcion) REFERENCES funciones(id_funcion)
);

-- Tabla de Domicilio
CREATE TABLE domicilios (
    id_domicilio INT PRIMARY KEY AUTO_INCREMENT,
    calle VARCHAR(100),
    numero VARCHAR(10),
    barrio VARCHAR(50),
    localidad VARCHAR(50),
    provincia VARCHAR(50),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de Grupo Familiar
CREATE TABLE grupo_familiar (
    id_familiar INT PRIMARY KEY AUTO_INCREMENT,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    fecha_nacimiento DATE,
    dni VARCHAR(15),
    vinculo VARCHAR(50),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de Tardanzas
CREATE TABLE tardanzas (
    id_tardanza INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    hora TIME,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de Partes y Novedades
CREATE TABLE partes_novedades (
    id_parte INT PRIMARY KEY AUTO_INCREMENT,
    tipo_parte VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    observacion TEXT,
    estado VARCHAR(50),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de Ficha Médica
CREATE TABLE fichas_medicas (
    id_ficha_medica INT PRIMARY KEY AUTO_INCREMENT,
    antecedentes_medicos TEXT,
    alergia_medico TEXT,
    factor_sangre VARCHAR(5),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de Diagnósticos Médicos
CREATE TABLE diagnosticos_medicos (
    id_diagnostico INT PRIMARY KEY AUTO_INCREMENT,
    diagnostico TEXT,
    dias_establecidos INT,
    id_parte INT,
    FOREIGN KEY (id_parte) REFERENCES partes_novedades(id_parte)
);

-- Tabla de Sanciones
CREATE TABLE sanciones (
    id_sancion INT PRIMARY KEY AUTO_INCREMENT,
    nombre_sancion VARCHAR(100),
    articulo VARCHAR(100),
    observacion TEXT,
    fecha DATE,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de Expedientes
CREATE TABLE expedientes (
    id_expediente INT PRIMARY KEY AUTO_INCREMENT,
    numero_expediente VARCHAR(50),
    legajo VARCHAR(50),
    libro VARCHAR(50),
    tomo VARCHAR(50),
    fojas VARCHAR(50),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla de Trámites del Expediente
CREATE TABLE tramites_expedientes (
    id_tramite INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    id_expediente INT,
    FOREIGN KEY (id_expediente) REFERENCES expedientes(id_expediente)
);

-- Tabla de Títulos
CREATE TABLE titulos (
    id_titulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_titulo VARCHAR(100),
    facultad VARCHAR(100),
    universidad VARCHAR(100),
    fecha_obtencion DATE,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);
