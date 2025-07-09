-- Script de inicialización para base de datos
-- Usuarios de prueba para testing del sistema

-- Esperar a que las tablas se creen automáticamente por Hibernate
-- Este script se ejecuta después de que Spring Boot cree las tablas

-- Usuarios de prueba según especificaciones del examen
INSERT INTO usuarios (nombre, correo, password, nombre_rol) VALUES
  ('Usuario Prueba', 'user', 'user123', 'USER'),
  ('Tecnico Prueba', 'tech', 'tech123', 'TECH'),
  ('Luisa Dardon Arevalo', 'ldarevalo@uca.edu.sv', 'password123', 'USER'),
  ('David Hurtado', 'dhurtado@uca.edu.sv', 'password456', 'TECH'),
  ('Maria Rodriguez', 'mrodriguez@uca.edu.sv', 'maria123', 'USER'),
  ('Carlos Mendez', 'cmendez@uca.edu.sv', 'carlos456', 'TECH')
    ON CONFLICT (correo) DO NOTHING;

-- Tickets de prueba para demostrar funcionalidad
INSERT INTO tickets (titulo, descripcion, estado, usuario_id, tecnico_asignado_id, fecha) VALUES
('Error en sistema de login', 'No puedo acceder al sistema principal', 'Abierto', 1, 2, NOW()),
('Problema con impresora', 'La impresora HP del 3er piso no funciona', 'En Proceso', 3, 4, NOW()),
('Solicitud de software', 'Necesito instalación de Adobe Photoshop', 'Abierto', 5, 6, NOW())
    ON CONFLICT DO NOTHING;