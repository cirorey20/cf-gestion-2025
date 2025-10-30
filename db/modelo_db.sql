CREATE DATABASE IF NOT EXISTS centro_formacion;
USE centro_formacion;

-- ============================================
-- 1️⃣ TABLA USUARIOS
-- ============================================
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(80) NOT NULL UNIQUE,
  contrasena VARCHAR(100) NOT NULL,
  rol ENUM('admin','instructor','alumno') NOT NULL,
  fecha DATE,
  activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- ============================================
-- 2️⃣ TABLA INSTRUCTORES
-- ============================================
CREATE TABLE instructores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  dni VARCHAR(11) NOT NULL UNIQUE,
  tel VARCHAR(20),
  usuario_id INT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ============================================
-- 3️⃣ TABLA CONTACTOS
-- ============================================
CREATE TABLE contactos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20),
  parentesco VARCHAR(20),
  tel VARCHAR(20)
) ENGINE=InnoDB;

-- ============================================
-- 4️⃣ TABLA ALUMNOS
-- ============================================
CREATE TABLE alumnos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  dni VARCHAR(11) NOT NULL UNIQUE,
  email VARCHAR(30),
  tel VARCHAR(20),
  fecha_nacimiento DATE,
  domicilio VARCHAR(255),
  activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- ============================================
-- 5️⃣ RELACIÓN ALUMNOS-CONTACTOS (1:N)
-- ============================================
CREATE TABLE alumno_contacto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  alumno_id INT NOT NULL,
  contacto_id INT NOT NULL,
  FOREIGN KEY (alumno_id) REFERENCES alumnos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (contacto_id) REFERENCES contactos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ============================================
-- 6️⃣ TABLA CURSOS
-- ============================================
CREATE TABLE cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT,
  codigo VARCHAR(255) NOT NULL UNIQUE,
  instructor_id INT,
  FOREIGN KEY (instructor_id) REFERENCES instructores(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ============================================
-- 7️⃣ TABLA HORARIOS
-- ============================================
CREATE TABLE horarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  dia_semana ENUM('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado') NOT NULL,
  horario_inicio TIME NOT NULL,
  horario_fin TIME NOT NULL,
  curso_id INT,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ============================================
-- 8️⃣ TABLA INSCRIPCIONES
-- ============================================
CREATE TABLE inscripciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  alumno_id INT NOT NULL,
  curso_id INT NOT NULL,
  fecha DATE NOT NULL,
  FOREIGN KEY (alumno_id) REFERENCES alumnos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ============================================
-- 9️⃣ TABLA PRESENTISMOS
-- ============================================
CREATE TABLE presentismos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estado ENUM('presente','ausente','tarde') NOT NULL,
  fecha DATE NOT NULL,
  hora TIME,
  id_alumno INT NOT NULL,
  id_curso INT NOT NULL,
  FOREIGN KEY (id_alumno) REFERENCES alumnos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (id_curso) REFERENCES cursos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

