--Base de datos--
CREATE DATABASE peliculas;
--Cambiar a la bd--
\c peliculas
--Creacion de tablas-- 
CREATE TABLE peliculas (id SMALLINT,nombre VARCHAR(60),estreno INT,director VARCHAR(35),PRIMARY KEY(id));
CREATE TABLE reparto (id_peliculas SMALLINT,nombre VARCHAR(35),FOREIGN KEY(id_peliculas) REFERENCES peliculas);
-- Llenado--
\COPY peliculas (id,nombre,estreno,director) FROM  'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\top100\peliculas.csv' csv header; 
\COPY reparto (id_peliculas,nombre) FROM  'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\top100\reparto.csv' csv;
    --Busquedas--
    SELECT id FROM peliculas WHERE nombre='Titanic';
    SELECT reparto.nombre FROM reparto, peliculas WHERE (peliculas.id=reparto.id_peliculas) AND (peliculas.nombre='Titanic');
    SELECT count(id_peliculas) FROM reparto WHERE nombre='Harrison Ford';
    SELECT * FROM peliculas WHERE estreno BETWEEN 1990 AND 1999 ORDER BY nombre ASC;
    SELECT nombre, LENGTH(nombre) AS longitud_titulo FROM peliculas;
        -- Max largo titulo--
        --1 opción--
        SELECT nombre, LENGTH(nombre) AS longitud_titulo FROM peliculas ORDER BY longitud_titulo DESC LIMIT 1;
        --2 opción-- 
        SELECT MAX(LENGTH(nombre)) AS Maximo_largo_titulo FROM peliculas;       
----
