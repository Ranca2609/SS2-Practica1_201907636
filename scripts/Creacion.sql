USE BDP1_SEMI2;

-- Creacion de la tabla temporal
CREATE TABLE temporal (
    id_entrega INT,
    dia VARCHAR(20),
	mes VARCHAR(20),
	anio VARCHAR(20),
	nombre_cliente VARCHAR(150),
	direccion VARCHAR(250),
	nombre_empleado VARCHAR(100),
	puesto_empleado VARCHAR(50),
	ciudad_entrega VARCHAR(100),
	nombre_producto VARCHAR(150),
	descripcion VARCHAR(250),
	peso DECIMAL,
	tiempo_entrega VARCHAR(5),
	estado_entrega VARCHAR(100),
	costo_envio DECIMAL,
	precio_producto DECIMAL
);

-- Creación de la tabla cliente
CREATE TABLE cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(150),
    direccion VARCHAR(250)
);

-- Creación de la tabla producto
CREATE TABLE producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(150),
    descripcion VARCHAR(250),
    precio DECIMAL,
    peso DECIMAL
);

-- Creación de la tabla entrega
CREATE TABLE entrega (
    id_entrega INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_entrega DATE,
    ciudad_entrega VARCHAR(50),
    estado VARCHAR(30)
);

-- Creación de la tabla empleado
CREATE TABLE empleado (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(150),
    puesto VARCHAR(50)
);

-- Creación de la tabla empleado
CREATE TABLE time_line (
    id_time_line INT IDENTITY(1,1) PRIMARY KEY,
    dia VARCHAR(15),
    mes VARCHAR(15),
    anio VARCHAR(4)
);

-- Creación de la tabla venta
CREATE TABLE venta (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    id_entrega INT,
    id_empleado INT,
    id_time_line INT,
    costo_envio DECIMAL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_entrega) REFERENCES entrega(id_entrega),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_time_line) REFERENCES time_line(id_time_line)
);
