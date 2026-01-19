-- Eliminar tabla y schema si existen
DROP TABLE IF EXISTS dummy_data.cliente CASCADE;
DROP SCHEMA IF EXISTS dummy_data CASCADE;

-- Crear schema
CREATE SCHEMA dummy_data AUTHORIZATION root;
GRANT ALL ON SCHEMA dummy_data TO root;

-- Crear tabla cliente
CREATE TABLE dummy_data.cliente (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    dni VARCHAR(20),
    edad INT,
    cumpleanos DATE,
    email VARCHAR(150)
);

-- Insertar 100 registros dummy
INSERT INTO dummy_data.cliente (nombre, dni, edad, cumpleanos, email) VALUES
('Juan Pérez', '12345678', 30, '1995-01-15', 'juan.perez@example.com'),
('María López', '87654321', 25, '2000-03-22', 'maria.lopez@example.com'),
('Carlos Gómez', '11223344', 40, '1985-07-09', 'carlos.gomez@example.com'),
('Ana Torres', '44332211', 28, '1997-11-30', 'ana.torres@example.com'),
('Luis Fernández', '55667788', 35, '1990-05-18', 'luis.fernandez@example.com'),
('Sofía Ramírez', '99887766', 22, '2003-09-12', 'sofia.ramirez@example.com'),
('Pedro Castillo', '33445566', 45, '1980-02-05', 'pedro.castillo@example.com'),
('Laura Díaz', '66778899', 33, '1992-06-25', 'laura.diaz@example.com'),
('Miguel Herrera', '77889900', 29, '1996-12-01', 'miguel.herrera@example.com'),
('Valeria Cruz', '88990011', 27, '1998-04-14', 'valeria.cruz@example.com'),
('Cliente100', '99999999', 50, '1975-10-10', 'cliente100@example.com');