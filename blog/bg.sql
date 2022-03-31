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
  --Busquedas--
  SELECT id,email,post_id,titulo,fecha FROM usuarios INNER JOIN post ON usuarios.id=usuarios_id WHERE id=5
  SELECT usuarios.id,email,comentarios.id,titulo,fecha FROM usuarios INNER JOIN comentarios on usuarios.id=usuarios_id WHERE email!='usuario06@hotmail.com';
  SELECT usuarios.id FROM usuarios WHERE usuarios.id NOT IN (SELECT usuarios.id FROM usuarios INNER JOIN post ON usuarios.id=post.usuarios_id) ORDER BY id ASC;
  SELECT * FROM post FULL OUTER JOIN comentarios ON post.id=comentarios.post_id ORDER BY post.id ASC;
  SELECT usuarios_id FROM comentarios WHERE fecha BETWEEN '2020-6-1' AND '2020-6-30';
----