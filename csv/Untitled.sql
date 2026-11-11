USE mi_proyecto;

CREATE TABLE Usuario (
    Id_usuario     INT          NOT NULL AUTO_INCREMENT,
    Nombres        VARCHAR(50)  NOT NULL,
    Apellidos      VARCHAR(50)  NOT NULL,
    Correo         VARCHAR(100) NOT NULL UNIQUE,
    Contrasena     VARCHAR(255) NOT NULL,
    Fecha_registro DATE         NOT NULL,
    Estado         VARCHAR(30)  NOT NULL DEFAULT 'Activo',
    PRIMARY KEY (Id_usuario),
    CHECK (Estado IN ('Activo', 'Inactivo', 'Bloqueado'))
);

CREATE TABLE Estudiante (
    Id_usuario      INT         NOT NULL,
    Cod_estudiante  VARCHAR(15) NOT NULL UNIQUE,
    Semestre        TINYINT     NOT NULL,
    Carrera         VARCHAR(80) NOT NULL,
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario),
    CHECK (Semestre BETWEEN 1 AND 10)
);

CREATE TABLE Docente (
    Id_usuario    INT         NOT NULL,
    Cod_docente   VARCHAR(15) NOT NULL UNIQUE,
    Departamento  VARCHAR(80) NOT NULL,
    Especialidad  VARCHAR(80),
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);

CREATE TABLE Administrativo (
    Id_usuario          INT         NOT NULL,
    Cod_administrativo  VARCHAR(15) NOT NULL UNIQUE,
    Area                VARCHAR(80) NOT NULL,
    Cargo               VARCHAR(80),
    PRIMARY KEY (Id_usuario),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario)
);

CREATE TABLE Rol (
    Id_rol      INT          NOT NULL AUTO_INCREMENT,
    Nombre_rol  VARCHAR(50)  NOT NULL UNIQUE,
    Descripcion VARCHAR(150),
    PRIMARY KEY (Id_rol)
);

CREATE TABLE Recurso (
    Id_recurso INT         NOT NULL AUTO_INCREMENT,
    Nombre     VARCHAR(80) NOT NULL UNIQUE,
    Tipo       VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_recurso)
);

CREATE TABLE Permiso (
    Id_permiso  INT          NOT NULL AUTO_INCREMENT,
    Accion      VARCHAR(30)  NOT NULL,
    Descripcion VARCHAR(150),
    Id_recurso  INT          NOT NULL,
    PRIMARY KEY (Id_permiso),
    FOREIGN KEY (Id_recurso) REFERENCES Recurso (Id_recurso),
    CHECK (Accion IN ('Consultar', 'Crear', 'Modificar', 'Eliminar'))
);

CREATE TABLE Usuario_Rol (
    Id_usuario INT NOT NULL,
    Id_rol     INT NOT NULL,
    PRIMARY KEY (Id_usuario, Id_rol),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario),
    FOREIGN KEY (Id_rol)     REFERENCES Rol (Id_rol)
);

CREATE TABLE Rol_Permiso (
    Id_rol     INT NOT NULL,
    Id_permiso INT NOT NULL,
    PRIMARY KEY (Id_rol, Id_permiso),
    FOREIGN KEY (Id_rol)     REFERENCES Rol (Id_rol),
    FOREIGN KEY (Id_permiso) REFERENCES Permiso (Id_permiso)
);

CREATE TABLE Sesion (
    Id_sesion     INT         NOT NULL AUTO_INCREMENT,
    Fecha_inicio  DATETIME    NOT NULL,
    Fecha_fin     DATETIME,
    Direccion_ip  VARCHAR(45) NOT NULL,
    Estado_sesion VARCHAR(20) NOT NULL DEFAULT 'Activa',
    Id_usuario    INT         NOT NULL,
    PRIMARY KEY (Id_sesion),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario (Id_usuario),
    CHECK (Estado_sesion IN ('Activa', 'Cerrada', 'Expirada')),
    CHECK (Fecha_fin IS NULL OR Fecha_fin >= Fecha_inicio)
);

CREATE TABLE Registro_Actividad (
    Id_registro   INT          NOT NULL AUTO_INCREMENT,
    Fecha_hora    DATETIME     NOT NULL,
    Accion        VARCHAR(30)  NOT NULL,
    Descripcion   VARCHAR(200),
    Dato_anterior VARCHAR(100),
    Dato_nuevo    VARCHAR(100),
    Id_sesion     INT          NOT NULL,
    Id_recurso    INT          NOT NULL,
    PRIMARY KEY (Id_registro),
    FOREIGN KEY (Id_sesion)  REFERENCES Sesion (Id_sesion),
    FOREIGN KEY (Id_recurso) REFERENCES Recurso (Id_recurso)
);