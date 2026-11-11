
<div align="center">

<img src="https://img.shields.io/badge/UNIDAD-01-DCC6F0?style=for-the-badge&labelColor=8064A2" />
<img src="https://img.shields.io/badge/BASE_DE_DATOS-DCC6F0?style=for-the-badge&labelColor=8064A2" />

# 🗄️ Informe de Fin de Unidad

*Diseño e implementación de una base de datos relacional para el control de accesos y el registro de actividad de usuarios en un sistema de información universitario.*

**Universidad Nacional de Loja**  
**Carrera de Computación · Tercer ciclo «A»**

</div>

---

## 🪻 1. Datos Generales

| **Campo** | **Detalle** |
|:---|:---|
| Asignatura | Base de Datos |
| Ciclo | 3.º «A» |
| Unidad | 1 |
| Docente | Edwin René Guamán Quinche |
| Estudiante | Pilar Valentina Naranjo Quizhpe |
| Fecha | 09 de noviembre de 2026 |

---

## 📌 2. Título del Proyecto

**Diseño e implementación de una base de datos relacional para el control de accesos y el registro de actividad de usuarios en un sistema de información universitario.**

---

## 📝 3. Contexto del Problema

En una universidad, los sistemas de información son utilizados diariamente por estudiantes, docentes y personal administrativo, quienes requieren diferentes niveles de acceso según sus funciones. Por ejemplo, los estudiantes necesitan consultar sus calificaciones y matrículas, los docentes gestionar los registros académicos de sus asignaturas y el personal administrativo acceder a herramientas de gestión académica y financiera.

Sin una base de datos que centralice los usuarios, sus roles y los permisos de cada rol, la administración de accesos puede volverse desorganizada, se duplican cuentas y resulta difícil saber quién consultó o modificó información sensible, como calificaciones o datos personales. Esto afecta a la institución, que queda expuesta a accesos no autorizados y posibles alteraciones de registros, mientras que los usuarios corren el riesgo de que su información sea vista por personas sin autorización.

Para abordar esta problemática, se requiere gestionar información relacionada con los usuarios, roles, permisos, recursos del sistema (módulos, reportes y registros), sesiones y un registro de actividad que almacene las consultas y modificaciones realizadas por los usuarios. La correcta administración de estos datos permitirá fortalecer el control de acceso, proteger la confidencialidad e integridad de la información y facilitar el seguimiento de las actividades mediante registros verificables.

---

## 🎯 4. Objetivos

### 4.1. Objetivo General

Diseñar e implementar una base de datos relacional para gestionar usuarios, roles, permisos y registros de actividad de un sistema de información universitario, aplicando el modelo entidad-relación y SQL, con el fin de controlar el acceso a la información y llevar un registro de la actividad de los usuarios.

### 4.2. Objetivos Específicos

1. Elaborar el diagrama Entidad-Relación y el modelo relacional que representen usuarios, roles, permisos, recursos, sesiones y registro de actividad.
2. Construir el esquema en SQL e implementar cinco consultas de álgebra relacional traducidas a SQL que permitan verificar permisos y analizar la actividad de los usuarios.

---

## 📐 5. Modelos Conceptuales de Base de Datos

### 5.1. Modelo Entidad-Relación (E-R)

<div align="center">

<img width="1081" height="405" alt="image" src="https://github.com/user-attachments/assets/1ae5ebba-05d0-42f4-97d8-40055e5f2172" />

**Figura 1.** Diagrama Entidad-Relación del sistema de control de accesos y registro de actividad.

</div>

[Ver Diagrama Entidad-Relación en draw.io](https://drive.google.com/file/d/1Pl0RMzwvHxqV1Lz3lfV8X2FJ_OePWQRm/view?usp=sharing)

### 5.2. Modelo Relacional

<div align="center">

<img width="975" height="682" alt="image" src="https://github.com/user-attachments/assets/56f92909-4fe2-4136-9b7d-1d034524678e" />

**Figura 2.** Modelo relacional del sistema de control de accesos y registro de actividad.

</div>
[Ver Diagrama Relacional en draw.io](https://drive.google.com/file/d/1NrhM9NKUjxrMsj9KOkywJR4cCTnosN3r/view?usp=sharing)

---

## 💻 6. Implementación en SQL

### 6.1. Creación de Tablas (DDL)

**Tabla Usuario**

```sql
CREATE TABLE Usuario (
    Id_usuario INT NOT NULL AUTO_INCREMENT,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Correo VARCHAR(100) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    Fecha_registro DATE NOT NULL,
    Estado VARCHAR(30) NOT NULL DEFAULT 'Activo',
    PRIMARY KEY (Id_usuario),
    CHECK (Estado IN ('Activo', 'Inactivo', 'Bloqueado'))
);
```

**Tabla Estudiante**

```sql
CREATE TABLE Estudiante (
    Id_usuario INT NOT NULL,
    Cod_estudiante VARCHAR(15) NOT NULL UNIQUE,
    Semestre TINYINT NOT NULL,
    Carrera VARCHAR(80) NOT NULL,
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario),
    CHECK (Semestre BETWEEN 1 AND 10)
);
```

**Tabla Docente**

```sql
CREATE TABLE Docente (
    Id_usuario INT NOT NULL,
    Cod_docente VARCHAR(15) NOT NULL UNIQUE,
    Departamento VARCHAR(80) NOT NULL,
    Especialidad VARCHAR(80),
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);
```

**Tabla Administrativo**

```sql
CREATE TABLE Administrativo (
    Id_usuario INT NOT NULL,
    Cod_administrativo VARCHAR(15) NOT NULL UNIQUE,
    Area VARCHAR(80) NOT NULL,
    Cargo VARCHAR(80),
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);
```

**Tabla Rol**

```sql
CREATE TABLE Rol (
    Id_rol INT NOT NULL AUTO_INCREMENT,
    Nombre_rol VARCHAR(50) NOT NULL UNIQUE,
    Descripcion VARCHAR(150),
    PRIMARY KEY (Id_rol)
);
```

---

### 6.2. Inserción de Datos (DML)

**Inserción en Usuario**

```sql
INSERT INTO Usuario
(Id_usuario, Nombres, Apellidos, Correo, Contrasena, Fecha_registro, Estado)
VALUES
(1, 'Ana', 'Pérez', 'ana.perez@unl.edu.ec', 'a1b2c3.ana', '2026-03-10', 'Activo'),
(2, 'Luis', 'Granda', 'luis.granda@unl.edu.ec', 'lg7x9k2m', '2026-01-15', 'Activo'),
(3, 'Sofía', 'Cueva', 'sofia.cueva@unl.edu.ec', 'sc4p8w1q', '2026-02-20', 'Activo'),
(4, 'Pedro', 'Armijos', 'pedro.armijos@unl.edu.ec', 'pa9t3z6r', '2026-01-10', 'Activo'),
(5, 'Rosa', 'Jiménez', 'rosa.jimenez@unl.edu.ec', 'rj2m5n8v', '2026-01-12', 'Activo'),
(6, 'Carlos', 'Mora', 'carlos.mora@unl.edu.ec', 'd4e5f6_mora', '2026-02-01', 'Activo'),
(7, 'Emilio', 'Coronel', 'emilio.coronel@unl.edu.ec', '13num5g2', '2026-04-19', 'Activo'),
(8, 'María', 'Lopez', 'maria.lopez@unl.edu.ec', 'lop23z8f9', '2026-03-14', 'Activo'),
(9, 'Jessica', 'Peña', 'jessica.pena@unl.edu.ec', 'jezz56p2g', '2026-01-27', 'Activo'),
(10, 'Diego', 'Vega', 'diego.vega@unl.edu.ec', 'dv6h1c4y', '2026-02-05', 'Bloqueado');
```

**Inserción en Estudiante**

```sql
INSERT INTO Estudiante (Id_usuario, Cod_estudiante, Semestre, Carrera)
VALUES
(1, 'EST-001', 2, 'Arquitectura'),
(3, 'EST-003', 6, 'Computacion'),
(6, 'EST-006', 4, 'Contabilidad'),
(7, 'EST-007', 5, 'Electricidad'),
(9, 'EST-009', 2, 'Minas');
```

**Inserción en Docente**

```sql
INSERT INTO Docente (Id_usuario, Cod_docente, Departamento, Especialidad)
VALUES
(2, 'DOC-002', 'Computación', 'Bases de datos'),
(4, 'DOC-004', 'Matemáticas', 'Estadística'),
(8, 'DOC-008', 'Computación', 'Redes');
```

**Inserción en Administrativo**

```sql
INSERT INTO Administrativo (Id_usuario, Cod_administrativo, Area, Cargo)
VALUES
(5, 'ADM-005', 'Secretaría', 'Secretaria académica'),
(10, 'ADM-010', 'Sistemas', 'Administrador de sistemas');
```

**Inserción en Rol**

```sql
INSERT INTO Rol (Id_rol, Nombre_rol, Descripcion)
VALUES
(1, 'Estudiante', 'Consulta su información académica'),
(2, 'Docente', 'Gestiona calificaciones de sus cursos'),
(3, 'Administrativo', 'Gestiona matrículas y reportes'),
(4, 'Administrador', 'Gestiona usuarios, roles y permisos'),
(5, 'Auditor', 'Revisa el registro de actividad del sistema');

```

###🗄️ **Scripts SQL del proyecto**
Los siguientes archivos contienen las instrucciones para crear la estructura de la base de datos e insertar los registros de prueba.
| Archivo | Descripción |
|:---|:---|
| [📥 Base de datos completa](https://github.com/pilarnaranjo/Proyecto/blob/d3a03cded12b0ddee2ae450c2194f7b6d09155ce/csv/Untitled.sql) | Creación de todas las tablas y relaciones mediante DDL. |
| [📥 Inserción de datos](https://github.com/pilarnaranjo/Proyecto/blob/eb4a2b27e1625234a8979d7e63e7c2a7b8c1990f/csv/INSERT.sql) | Registros de prueba mediante instrucciones DML. |

### 6.3. Archivos CSV

Los datos utilizados en el proyecto se encuentran organizados en archivos CSV, correspondientes a las tablas de la base de datos.

| N.º | Tabla | Archivo CSV |
|:---:|:---|:---|
| 1 | Usuario | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Usuario.csv) |
| 2 | Estudiante | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Estudiante.csv) |
| 3 | Docente | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Docente.csv) |
| 4 | Administrativo | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Administrativo.csv) |
| 5 | Rol | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Rol.csv) |
| 6 | Usuario_Rol | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/UsuarioRol.csv) |
| 7 | Permiso | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Permiso.csv) |
| 8 | Rol_Permiso | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/RolPermiso.csv) |
| 9 | Recurso | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Recurso.csv) |
| 10 | Sesion | [Ver CSV](https://github.com/pilarnaranjo/Proyecto/blob/765ff4a49c545bae39f983d9f0fab8112377f697/csv/Sesion.csv) |
---

## 🔎 7. Consultas de Álgebra Relacional y su Traducción a SQL

### 7.1. Consulta 1 — Selección, Proyección y Join (σ, π, ⋈)

**Objetivo:** Obtener el nombre, el correo y la especialidad de los docentes del departamento de Computación.

**Álgebra Relacional:**

```text
π nombres, apellidos, correo (σ departamento = 'Computación' (Usuario ⋈ Docente))
```

**SQL:**

```sql
SELECT u.nombres, u.apellidos, u.correo, d.especialidad
FROM Usuario u
JOIN Docente d ON u.Id_usuario = d.Id_usuario
WHERE d.departamento = 'Computación';
```

**Resultado esperado:** Una fila por cada docente de Computación, con sus datos de contacto y su especialidad.

<img width="975" height="288" alt="image" src="https://github.com/user-attachments/assets/f27fe6b2-1b37-4c52-95ed-b2407550a2c6" />

---

### 7.2. Consulta 2 — Diferencia (−)

**Objetivo:** Encontrar los usuarios registrados que nunca han iniciado sesión.

**Álgebra Relacional:**

```text
π idUsuario (Usuario) − π idUsuario (Sesion)
```

**SQL:**

```sql
SELECT u.Id_usuario, u.nombres, u.apellidos, u.correo
FROM Usuario u
WHERE u.Id_usuario NOT IN (
    SELECT s.Id_usuario
    FROM Sesion s
);
```

**Resultado esperado:** Los usuarios que no aparecen en ninguna sesión, útiles para detectar cuentas sin uso.
<img width="975" height="234" alt="image" src="https://github.com/user-attachments/assets/2528bb8f-4cac-4b2b-ae25-3f46494eac45" />

---

### 7.3. Consulta 3 — Intersección (∩)

**Objetivo:** Identificar los usuarios que tienen a la vez los roles Docente y Auditor.

**Álgebra Relacional:**

```text
π idUsuario (σ nombreRol = 'Docente' (UsuarioRol ⋈ Rol))
∩
π idUsuario (σ nombreRol = 'Auditor' (UsuarioRol ⋈ Rol))
```

**SQL:**

```sql
SELECT ur.Id_usuario
FROM Usuario_Rol ur
JOIN Rol r ON ur.Id_rol = r.Id_rol
WHERE r.Nombre_Rol = 'Docente'

INTERSECT

SELECT ur.Id_usuario
FROM Usuario_Rol ur
JOIN Rol r ON ur.Id_rol = r.Id_rol
WHERE r.Nombre_Rol = 'Auditor';
```

**Resultado esperado:** Los usuarios con ambos roles asignados, que son un caso de acumulación.
<img width="975" height="318" alt="image" src="https://github.com/user-attachments/assets/b12aef71-ffc1-49f7-b088-1c0898e90f9c" />

---

### 7.4. Consulta 4 — División (÷)

**Objetivo:** Encontrar los roles que tienen todos los permisos definidos sobre el recurso Calificaciones, para saber qué roles tienen control total sobre las notas.

**Álgebra Relacional:**

```text
π idRol, idPermiso (RolPermiso) ÷
π idPermiso (σ nombre = 'Calificaciones' (Permiso ⋈ Recurso))
```

**SQL:**

```sql
SELECT rp.Id_rol
FROM Rol_Permiso rp
JOIN Permiso p ON rp.Id_Permiso = p.Id_Permiso
JOIN Recurso r ON p.Id_recurso = r.Id_recurso
WHERE r.nombre = 'Calificaciones'
GROUP BY rp.Id_rol
HAVING COUNT(DISTINCT rp.Id_Permiso) = (
    SELECT COUNT(*)
    FROM Permiso p2
    JOIN Recurso r2 ON p2.Id_recurso = r2.Id_recurso
    WHERE r2.nombre = 'Calificaciones'
);
```

**Resultado esperado:** Los roles con control total sobre las calificaciones. Si solo el docente puede consultar y modificar, solo ese rol aparece.
<img width="967" height="275" alt="image" src="https://github.com/user-attachments/assets/9a7284ec-4337-400a-b641-467e6ffba43b" />

---

### 7.5. Consulta 5 — Join (⋈), Selección y Proyección

**Objetivo:** Mostrar quién modificó qué recurso, con el dato anterior y el nuevo, para tener el historial de cambios del sistema.

**Álgebra Relacional:**

```text
π nombres, apellidos, nombre, fechaHora, datoAnterior, datoNuevo
(σ accion = 'Modificar' (RegistroActividad ⋈ Sesion ⋈ Usuario ⋈ Recurso))
```

**SQL:**

```sql
SELECT u.nombres, u.apellidos, r.nombre AS recurso,
       ra.fechaHora, ra.dato_Anterior, ra.dato_Nuevo
FROM Usuario u, Sesion s, RegistroActividad ra, Recurso r
WHERE u.Id_usuario = s.Id_usuario
  AND s.Id_sesion = ra.Id_sesion
  AND ra.Id_recurso = r.Id_recurso
  AND ra.accion = 'Modificar'
ORDER BY ra.fechaHora;
```

**Resultado esperado:** Siete filas, una por cada modificación registrada.
<img width="975" height="337" alt="image" src="https://github.com/user-attachments/assets/68db13b5-e9ec-475c-ab33-8129f72d8e2a" />

---

## 🪻 8. Conclusiones

- El desarrollo del diagrama Entidad-Relación y su transformación al modelo relacional me permitió comprender cómo organizar la información de un sistema de control de accesos universitario. Una de las principales dificultades fue identificar las entidades necesarias y establecer correctamente sus relaciones y cardinalidades, especialmente al representar los usuarios, roles y permisos. Este proceso ayudó a estructurar la información y evitar duplicaciones.

- La implementación de la base de datos mediante SQL me permitió llevar el diseño a la práctica y comprender cómo se crean y relacionan las tablas. Durante este proceso aprendí la importancia de definir correctamente las claves primarias y foráneas, las restricciones y el orden de inserción de los datos. Además, corregir los errores encontrados permitió mejorar la escritura y ejecución de las sentencias SQL.

- El uso del álgebra relacional me permitió comprender cómo organizar las consultas antes de escribirlas en SQL. Mediante operaciones como selección, proyección y join, fue posible obtener información de diferentes tablas. Las consultas relacionadas con los usuarios, sus permisos y el registro de actividades fueron especialmente útiles, ya que permiten conocer los accesos y las acciones realizadas dentro del sistema.

---

## 📚 9. Bibliografía

[1] R. Elmasri y S. B. Navathe, *Fundamentos de sistemas de bases de datos*, 7.ª ed. Madrid, España: Pearson, 2016.

[2] A. Silberschatz, H. F. Korth y S. Sudarshan, *Fundamentos de bases de datos*, 6.ª ed. Madrid, España: McGraw-Hill, 2014.

[3] Oracle Corporation, «MySQL 8.0 Reference Manual». [En línea]. Disponible en: https://dev.mysql.com/doc/refman/8.0/en/

[4] Universidad Nacional de Loja, «Calendario académico-administrativo, nivel de grado, año 2025-2026», Loja, Ecuador, 2026. [En línea]. Disponible en: https://unl.edu.ec/sites/default/files/gaceta/anexo/2026-01/calendario_acade%CC%81mico_2025-2026_reformado-signed.pdf

---

<div align="center">

<img src="https://img.shields.io/badge/UNIVERSIDAD_NACIONAL_DE_LOJA-DCC6F0?style=flat-square&labelColor=8064A2" />

*Portafolio Digital de Aprendizaje*  
**Carrera de Computación · Base de Datos**

</div>
