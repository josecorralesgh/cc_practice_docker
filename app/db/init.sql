-- Create the database
CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

-- Crear la tabla de usuarios
CREATE TABLE usuarios (
  usuario_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  correo_electronico VARCHAR(100) UNIQUE
);

-- Crear la tabla de publicaciones
CREATE TABLE publicaciones (
  publicacion_id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100),
  contenido TEXT,
  autor_id INT,
  FOREIGN KEY (autor_id) REFERENCES usuarios(usuario_id)
);

-- Crear la tabla de comentarios
CREATE TABLE comentarios (
  comentario_id INT AUTO_INCREMENT PRIMARY KEY,
  contenido TEXT,
  autor_id INT,
  publicacion_id INT,
  FOREIGN KEY (autor_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id)
);

-- Inserta valores
-- Insertar datos de ejemplo en la tabla de usuarios
INSERT INTO usuarios (nombre, correo_electronico) VALUES
  ('Juan Perez', 'juan@example.com'),
  ('Maria Rodriguez', 'maria@example.com'),
  ('Carlos Gomez', 'carlos@example.com'),
  ('Ana Martinez', 'ana@example.com'),
  ('Pedro Ramirez', 'pedro@example.com');

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

