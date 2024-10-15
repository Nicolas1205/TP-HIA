CREATE TABLE `domicilio` (
  `id_domicilio` int PRIMARY KEY AUTO_INCREMENT,
  `calle` varchar(100),
  `numero` int(10),
  `barrio` varchar(50),
  `localidad` varchar(50),
  `provincia` varchar(50),
  `id_empleado` int
);

CREATE TABLE `partes` (
  `id_parte` int PRIMARY KEY AUTO_INCREMENT,
  `tipo_parte` varchar(100),
  `fecha_inicio` date,
  `fecha_fin` date,
  `observacion` text,
  `estado` varchar(50),
  `id_emp` int
);

CREATE TABLE `diagnosticos_medicos` (
  `id_diagnostico` int PRIMARY KEY AUTO_INCREMENT,
  `diagnostico` text,
  `dias_establecidos` int,
  `id_parte` int
);

CREATE TABLE `titulo` (
  `id_titulo` int PRIMARY KEY AUTO_INCREMENT,
  `nombre_titulo` varchar(100),
  `facultad` varchar(100),
  `universidad` varchar(100)
);

CREATE TABLE `titulo_Emp` (
  `id_tituloemp` int PRIMARY KEY AUTO_INCREMENT,
  `id_titulo` int,
  `fecha` date,
  `id_empleado` int
);

CREATE TABLE `empleados` (
  `id_emp` int PRIMARY KEY AUTO_INCREMENT,
  `apellido` varchar(50),
  `nombre` varchar(50),
  `dni` varchar(15) UNIQUE,
  `cuil` varchar(15) UNIQUE,
  `fecha_nacimiento` date,
  `sexo` varchar(10),
  `estado_civil` varchar(20),
  `nivel_estudio` varchar(50),
  `nacionalidad` varchar(50)
);

CREATE TABLE `sancion` (
  `id_sancion` int PRIMARY KEY AUTO_INCREMENT,
  `nombre_sancion` varchar(100),
  `articulo` varchar(100),
  `observacion` text,
  `fecha` date,
  `id_empleado` int
);

CREATE TABLE `asistencia` (
  `id_asistencia` integer PRIMARY KEY AUTO_INCREMENT,
  `hora` time,
  `fecha` date,
  `id_empleado` int
);

CREATE TABLE `tardanza` (
  `id_tardanza` integer PRIMARY KEY AUTO_INCREMENT,
  `hora` time,
  `fecha` date,
  `observacion` text,
  `id_empleado` int
);

CREATE TABLE `categoria` (
  `id_categoria` int PRIMARY KEY AUTO_INCREMENT,
  `nombre_categoria` varchar(50),
  `fecha_designacion` date,
  `resolucion` varchar(100)
);

CREATE TABLE `ascenso` (
  `id_ascenso` integer PRIMARY KEY AUTO_INCREMENT,
  `categoriavieja` int,
  `categorianueva` int,
  `fecha` date,
  `id_empleado` int
);

CREATE TABLE `departamento` (
  `id_dep` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50),
  `descripcion` text,
  `area` varchar(50)
);

CREATE TABLE `historaldep` (
  `id_historialdep` integer PRIMARY KEY AUTO_INCREMENT,
  `fecha` date,
  `id_empleado` int,
  `id_dep` int
);

CREATE TABLE `dlaborales` (
  `id_datoslaborales` integer PRIMARY KEY AUTO_INCREMENT,
  `legajo` varchar(20),
  `fecha_ingreso` date,
  `id_categoria` int,
  `id_funcion` int,
  `departamento_asignado` varchar(100),
  `horario_trabajo` varchar(50),
  `turno` varchar(20),
  `id_empleado` int
);

CREATE TABLE `funciones` (
  `id_funcion` int PRIMARY KEY AUTO_INCREMENT,
  `nombre_funcion` varchar(100),
  `descripcion_funcion` text
);

CREATE TABLE `grupo_familiar` (
  `id_familiar` int PRIMARY KEY AUTO_INCREMENT,
  `apellido` varchar(50),
  `nombre` varchar(50),
  `fecha_nacimiento` date,
  `dni` varchar(15),
  `vinculo` varchar(50),
  `id_empleado` int
);

CREATE TABLE `fichas_medicas` (
  `id_ficha_medica` int PRIMARY KEY AUTO_INCREMENT,
  `antecedentes_medicos` text,
  `alergia_medico` text,
  `factor_sangre` varchar(5),
  `id_empleado` int
);

CREATE TABLE `expedientes` (
  `id_expediente` int PRIMARY KEY AUTO_INCREMENT,
  `numero_expediente` varchar(50),
  `legajo` varchar(50),
  `libro` varchar(50),
  `tomo` varchar(50),
  `fojas` varchar(50),
  `id_empleado` int
);

CREATE TABLE `tramites_expedientes` (
  `id_tramite` int PRIMARY KEY AUTO_INCREMENT,
  `descripcion` text,
  `id_expediente` int
);

ALTER TABLE `domicilio` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `partes` ADD FOREIGN KEY (`id_emp`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `diagnosticos_medicos` ADD FOREIGN KEY (`id_parte`) REFERENCES `partes` (`id_parte`);

ALTER TABLE `titulo_Emp` ADD FOREIGN KEY (`id_titulo`) REFERENCES `titulo` (`id_titulo`);

ALTER TABLE `titulo_Emp` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `sancion` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `asistencia` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `tardanza` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `ascenso` ADD FOREIGN KEY (`categoriavieja`) REFERENCES `categoria` (`id_categoria`);

ALTER TABLE `ascenso` ADD FOREIGN KEY (`categorianueva`) REFERENCES `categoria` (`id_categoria`);

ALTER TABLE `ascenso` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `historaldep` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `historaldep` ADD FOREIGN KEY (`id_dep`) REFERENCES `departamento` (`id_dep`);

ALTER TABLE `dlaborales` ADD FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

ALTER TABLE `dlaborales` ADD FOREIGN KEY (`id_funcion`) REFERENCES `funciones` (`id_funcion`);

ALTER TABLE `dlaborales` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `grupo_familiar` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `fichas_medicas` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `expedientes` ADD FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emp`);

ALTER TABLE `tramites_expedientes` ADD FOREIGN KEY (`id_expediente`) REFERENCES `expedientes` (`id_expediente`);
