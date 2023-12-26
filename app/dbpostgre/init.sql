-- Conectar a la base de datos 'mydatabase' (esta instrucción no es necesaria en un script SQL)
-- \c mydatabase;

-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  usuario_id SERIAL PRIMARY KEY,
  nombre VARCHAR(50),
  correo_electronico VARCHAR(100) UNIQUE
);

-- Crear la tabla de publicaciones
CREATE TABLE IF NOT EXISTS publicaciones (
  publicacion_id SERIAL PRIMARY KEY,
  titulo VARCHAR(100),
  contenido TEXT,
  autor_id INT,
  FOREIGN KEY (autor_id) REFERENCES usuarios(usuario_id)
);

-- Crear la tabla de comentarios
CREATE TABLE IF NOT EXISTS comentarios (
  comentario_id SERIAL PRIMARY KEY,
  contenido TEXT,
  autor_id INT,
  publicacion_id INT,
  FOREIGN KEY (autor_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id)
);

-- Insertar valores
-- Insertar datos de ejemplo en la tabla de usuarios
INSERT INTO usuarios (nombre, correo_electronico) VALUES
  ('Juan Perez', 'juan@gmail.com'),
  ('Maria Rodriguez', 'maria@gmail.com'),
  ('Carlos Gomez', 'carlos@gmail.com'),
  ('Ana Martinez', 'ana@yahoo.com'),
  ('Pedro Ramirez', 'pedro@outlook.com');

-- Insertar datos de ejemplo en la tabla de publicaciones
INSERT INTO publicaciones (titulo, contenido, autor_id) VALUES
  ('Primer Post', 'Contenido del primer post...', 1),
  ('Segundo Post', 'Contenido del segundo post...', 2),
  ('Tercer Post', 'Contenido del tercer post...', 3),
  ('Cuarto Post', 'Contenido del cuarto post...', 1),
  ('Quinto Post', 'Contenido del quinto post...', 4);

-- Insertar datos de ejemplo en la tabla de comentarios
INSERT INTO comentarios (contenido, autor_id, publicacion_id) VALUES
  ('Excelente post!', 2, 1),
  ('Me encantó este contenido.', 4, 2),
  ('¿Alguien más piensa que esto es genial?', 3, 1),
  ('¡Muy interesante!', 5, 3),
  ('Gracias por compartir esto.', 1, 2);
