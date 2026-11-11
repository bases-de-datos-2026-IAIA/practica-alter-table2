
CREATE DATABASE IF NOT EXISTS HotelPatitas_Practica;
USE HotelPatitas_Practica;

CREATE TABLE IF NOT EXISTS cliente AS SELECT * FROM hotelpatitas.cliente;
CREATE TABLE IF NOT EXISTS estancia AS SELECT * FROM hotelpatitas.estancia;
CREATE TABLE IF NOT EXISTS mascota AS SELECT * FROM hotelpatitas.mascota;
CREATE TABLE IF NOT EXISTS servicio AS SELECT * FROM hotelpatitas.servicio;
CREATE TABLE IF NOT EXISTS estanciaservicio AS SELECT * FROM hotelpatitas.estanciaservicio;


ALTER TABLE cliente ADD PRIMARY KEY (id_cliente);
ALTER TABLE estancia ADD PRIMARY KEY (id_estancia);
ALTER TABLE mascota ADD PRIMARY KEY (id_mascota);
ALTER TABLE servicio ADD PRIMARY KEY (id_servicio);
ALTER TABLE estanciaservicio ADD PRIMARY KEY (id_estancia, id_servicio);

ALTER TABLE cliente MODIFY COLUMN id_cliente INT NOT NULL AUTO_INCREMENT;
ALTER TABLE mascota MODIFY COLUMN id_mascota INT NOT NULL AUTO_INCREMENT;
ALTER TABLE servicio MODIFY COLUMN id_servicio INT NOT NULL AUTO_INCREMENT;
ALTER TABLE estancia MODIFY COLUMN id_estancia INT NOT NULL AUTO_INCREMENT;


ALTER TABLE mascota
  ADD CONSTRAINT fk_mascota_cliente
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE estancia
  ADD CONSTRAINT fk_estancia_mascota
  FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota);

ALTER TABLE estanciaservicio
  ADD CONSTRAINT fk_estanciaservicio_servicio
  FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio);

ALTER TABLE estanciaservicio
  ADD CONSTRAINT fk_estanciaservicio_estancia
  FOREIGN KEY (id_estancia) REFERENCES estancia(id_estancia);

-- Columna que se usará en el ejercicio 7 (si servicio aún no la tiene)
ALTER TABLE servicio ADD COLUMN descripcion VARCHAR(150) AFTER nombre;

-- ---------- EJERCICIOS ---------

-- 1. Agregar columna correo a Cliente (VARCHAR(100))
ALTER TABLE cliente ADD COLUMN correo VARCHAR(100);

-- 2. Agregar columna observaciones a Estancia (TEXT)
ALTER TABLE estancia ADD COLUMN observaciones TEXT;

-- 3. Modificar peso de Mascota a DECIMAL(5,2)
ALTER TABLE mascota MODIFY COLUMN peso DECIMAL(5,2);

-- 4. Renombrar telefono de Cliente a telefono_principal
ALTER TABLE cliente RENAME COLUMN telefono TO telefono_principal;

-- 5. CHECK para validar peso > 0 en Mascota
ALTER TABLE mascota ADD CONSTRAINT chk_mascota_peso CHECK (peso > 0);

-- 6. UNIQUE para que correo de Cliente no se repita
ALTER TABLE cliente ADD CONSTRAINT uq_cliente_correo UNIQUE (correo);

-- 7. Mover descripcion al final de la tabla servicio
--    (la última columna actual de servicio es precio)
ALTER TABLE servicio MODIFY COLUMN descripcion VARCHAR(150) AFTER precio;


DESCRIBE cliente;
DESCRIBE estancia;
DESCRIBE mascota;
DESCRIBE servicio;
SHOW CREATE TABLE cliente;
SHOW CREATE TABLE mascota;