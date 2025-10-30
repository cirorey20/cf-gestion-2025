USE centro_formacion;

-- ============================================
-- 👤 1️⃣ USUARIOS
-- ============================================
INSERT INTO usuarios (email, contrasena, rol, fecha, activo)
VALUES
('admin@centro.com', 'admin123', 'admin', CURDATE(), TRUE),
('instructor1@centro.com', 'instructor123', 'instructor', CURDATE(), TRUE);

-- ============================================
-- 🧑‍🏫 2️⃣ INSTRUCTORES
-- ============================================
INSERT INTO instructores (nombre, apellido, dni, tel, usuario_id)
VALUES
('Carlos', 'Fernandez', '30555111', '1156781234', 2);

-- ============================================
-- 👪 3️⃣ CONTACTOS
-- ============================================
INSERT INTO contactos (nombre, apellido, parentesco, tel)
VALUES
('Ana', 'Lopez', 'Madre', '1122334455'),
('Jorge', 'Lopez', 'Padre', '1199887766'),
('Lucia', 'Perez', 'Tía', '1144556677');

-- ============================================
-- 🧒 4️⃣ ALUMNOS
-- ============================================
INSERT INTO alumnos (nombre, apellido, dni, email, tel, fecha_nacimiento, domicilio, activo)
VALUES
('María', 'Lopez', '45222111', 'maria.lopez@gmail.com', '1166778899', '2008-05-15', 'Av. Siempre Viva 742', TRUE),
('Juan', 'Gomez', '45111999', 'juan.gomez@gmail.com', '1177889900', '2007-10-22', 'Calle San Martín 1200', TRUE),
('Camila', 'Perez', '46000222', 'camila.perez@gmail.com', '1133445566', '2009-03-10', 'Belgrano 550', TRUE);

-- ============================================
-- 🤝 5️⃣ RELACIÓN ALUMNO-CONTACTO
-- ============================================
INSERT INTO alumno_contacto (alumno_id, contacto_id)
VALUES
(1, 1), -- María - Ana
(1, 2), -- María - Jorge
(3, 3); -- Camila - Lucía

-- ============================================
-- 📘 6️⃣ CURSOS
-- ============================================
INSERT INTO cursos (nombre, descripcion, codigo, instructor_id)
VALUES
('Programación Web', 'Curso de desarrollo web con HTML, CSS y PHP', 'WEB101', 1),
('Bases de Datos SQL', 'Curso introductorio a SQL y modelado relacional', 'SQL102', 1);

-- ============================================
-- ⏰ 7️⃣ HORARIOS
-- ============================================
INSERT INTO horarios (dia_semana, horario_inicio, horario_fin, curso_id)
VALUES
('Lunes', '09:00:00', '11:00:00', 1),
('Miércoles', '09:00:00', '11:00:00', 1),
('Martes', '10:00:00', '12:00:00', 2),
('Jueves', '10:00:00', '12:00:00', 2);

-- ============================================
-- 📝 8️⃣ INSCRIPCIONES
-- ============================================
INSERT INTO inscripciones (alumno_id, curso_id, fecha)
VALUES
(1, 1, CURDATE()),
(2, 1, CURDATE()),
(3, 2, CURDATE());

-- ============================================
-- 📅 9️⃣ PRESENTISMOS
-- ============================================
INSERT INTO presentismos (estado, fecha, hora, id_alumno, id_curso)
VALUES
('presente', CURDATE(), '09:05:00', 1, 1),
('tarde', CURDATE(), '09:20:00', 2, 1),
('ausente', CURDATE(), '10:00:00', 3, 2);

