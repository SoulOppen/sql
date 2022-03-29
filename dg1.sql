CREATE DATABASE posts;
\c posts
--tabla 1--
CREATE TABLE post(id SMALLINT,nombre_usuario CHAR(10),fecha_creacion DATE,contenido VARCHAR(25),descripcion VARCHAR(25),PRIMARY KEY(id));
-- Insertar datos--
    INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) VALUES (1,'Pamela','2022-3-28','PA','L');
    INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) VALUES (2,'Pamela','2022-3-28','PB','L');
    INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) VALUES (3,'Carlos','2022-3-28','C2','N');
-- Agregar Titulo--
ALTER TABLE post
    ADD titulo CHAR(10);
-- Agregar Valores titulo--
    UPDATE post SET titulo='t1' WHERE id=1;
    UPDATE post SET titulo='t2' WHERE id=2;
    UPDATE post SET titulo='t3' WHERE id=3;
--Insertar Datos--
    INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion,titulo) VALUES (4,'Pedro','2022-3-28','P1','N','t4');
    INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion,titulo) VALUES (5,'Pedro','2022-3-28','P2','N','t5');
--Borrar datos--
    DELETE FROM post WHERE nombre_usuario='Carlos';
--inserta dato--
    INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion,titulo) VALUES (6,'Carlos','2022-3-28','C3','N','t6');
--tabla 1 end--
--table 2--
CREATE TABLE comentarios(id SMALLINT,fecha_creacion DATE,hora TIME,contenido VARCHAR,post_id SMALLINT,FOREIGN KEY(post_id) REFERENCES post,PRIMARY KEY(id));
    -- Comentaros a Pamela--
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (1,'2022-3-28','10:42:00','OL',1);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (2,'2022-3-28','10:43:00','OL2',1);
    -- Comentarios a Carlos--
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (3,'2022-3-28','12:43:00','45',6);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (4,'2022-3-28','12:45:00','pl',6);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (5,'2022-3-28','14:23:00','+1',6);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (6,'2022-3-28','15:48:11','+2',6);
    --post margarita--
    INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion,titulo) VALUES (7,'Margarita','2022-3-28','M1','N1','t7');
    -- Comentarios a Margarita
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (7,'2022-3-28','15:43:00','45',7);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (8,'2022-3-28','16:45:00','pl',7);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (9,'2022-3-28','17:03:00','+1',7);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (10,'2022-3-28','18:32:11','+2',7);
    INSERT INTO comentarios (id,fecha_creacion,hora,contenido,post_id) VALUES (11,'2022-3-28','18:35:45','-5',7);
--table 2 end --