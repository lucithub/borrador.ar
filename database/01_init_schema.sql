CREATE DATABASE borrador_db;
GO
USE borrador_db;
GO

CREATE TABLE Usuarios (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    rol VARCHAR(50) NOT NULL DEFAULT 'ROLE_USER'
);

CREATE TABLE Carpetas (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    nombre VARCHAR(100) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    usuario_id UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT FK_Carpetas_Usuarios FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Notas (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    titulo VARCHAR(255) NOT NULL,
    contenido NVARCHAR(MAX),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    eliminada BIT DEFAULT 0,
    usuario_id UNIQUEIDENTIFIER NOT NULL,
    carpeta_id UNIQUEIDENTIFIER NULL,
    
    CONSTRAINT FK_Notas_Usuarios FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    
    -- Si se borra la carpeta, esto pasa a NULL
    CONSTRAINT FK_Notas_Carpetas FOREIGN KEY (carpeta_id) REFERENCES Carpetas(id) ON DELETE SET NULL
);