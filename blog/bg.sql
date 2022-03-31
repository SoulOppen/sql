--Base de datos--
CREATE DATABASE blog;
--Cambiar a la bd--
\c blog
--Creacion de tablas-- 
CREATE TABLE usuarios (id INT,email VARCHAR(25),PRIMARY KEY(id));
CREATE TABLE post (id INT,usuarios_id INT,titulo VARCHAR(30),fecha DATE,FOREIGN KEY(usuarios_id) REFERENCES usuarios,PRIMARY KEY(id));
CREATE TABLE comentarios (id INT,usuarios_id INT,post_id INT,titulo VARCHAR(30),fecha DATE,FOREIGN KEY(usuarios_id) REFERENCES usuarios,FOREIGN KEY(post_id) REFERENCES post,PRIMARY KEY(id));
-- Llenado--
\COPY usuarios (id,email) FROM  'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\blog\usuarios.csv' csv header;
\COPY post (id,usuarios_id,titulo,fecha) FROM  'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\blog\post.csv' csv header;
\COPY comentarios (id,usuarios_id,post_id,titulo,fecha) FROM  'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\blog\comentarios.csv' csv header;
 