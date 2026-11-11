INSERT INTO Usuario (Id_usuario, Nombres, Apellidos, Correo, Contrasena, Fecha_registro, Estado) VALUES
(1,  'Ana',     'Pérez',   'ana.perez@unl.edu.ec',      'a1b2c3.ana',  '2026-03-10', 'Activo'),
(2,  'Luis',    'Granda',  'luis.granda@unl.edu.ec',    'lg7x9k2m',    '2026-01-15', 'Activo'),
(3,  'Sofía',   'Cueva',   'sofia.cueva@unl.edu.ec',    'sc4p8w1q',    '2026-02-20', 'Activo'),
(4,  'Pedro',   'Armijos', 'pedro.armijos@unl.edu.ec',  'pa9t3z6r',    '2026-01-10', 'Activo'),
(5,  'Rosa',    'Jiménez', 'rosa.jimenez@unl.edu.ec',   'rj2m5n8v',    '2026-01-12', 'Activo'),
(6,  'Carlos',  'Mora',    'carlos.mora@unl.edu.ec',    'd4e5f6_mora', '2026-02-01', 'Activo'),
(7,  'Emilio',  'Coronel', 'emilio.coronel@unl.edu.ec', '13num5g2',    '2026-04-19', 'Activo'),
(8,  'María',   'Lopez',   'maria.lopez@unl.edu.ec',    'lop23z8f9',   '2026-03-14', 'Activo'),
(9,  'Jessica', 'Peña',    'jessica.pena@unl.edu.ec',   'jezz56p2g',   '2026-01-27', 'Activo'),
(10, 'Diego',   'Vega',    'diego.vega@unl.edu.ec',     'dv6h1c4y',    '2026-02-05', 'Bloqueado');

INSERT INTO Estudiante (Id_usuario, Cod_estudiante, Semestre, Carrera) VALUES
(1, 'EST-001', 2, 'Arquitectura'),
(3, 'EST-003', 6, 'Computacion'),
(6, 'EST-006', 4, 'Contabilidad'),
(7, 'EST-007', 5, 'Electricidad'),
(9, 'EST-009', 2, 'Minas');

INSERT INTO Docente (Id_usuario, Cod_docente, Departamento, Especialidad) VALUES
(2, 'DOC-002', 'Computación',  'Bases de datos'),
(4, 'DOC-004', 'Matemáticas',  'Estadística'),
(8, 'DOC-008', 'Computación',  'Redes');

INSERT INTO Administrativo (Id_usuario, Cod_administrativo, Area, Cargo) VALUES
(5,  'ADM-005', 'Secretaría', 'Secretaria académica'),
(10, 'ADM-010', 'Sistemas',   'Administrador de sistemas');

INSERT INTO Rol (Id_rol, Nombre_rol, Descripcion) VALUES
(1, 'Estudiante',     'Consulta su información académica'),
(2, 'Docente',        'Gestiona calificaciones de sus cursos'),
(3, 'Administrativo', 'Gestiona matrículas y reportes'),
(4, 'Administrador',  'Gestiona usuarios, roles y permisos'),
(5, 'Auditor',        'Revisa el registro de actividad del sistema');