# Borrador.ar 📝

Borrador.ar es una aplicación web Single Page Application (SPA) minimalista para la creación y gestión rápida de notas. El proyecto está diseñado con un enfoque fuerte en escalabilidad, rendimiento y estándares de la industria.

## 🚀 Arquitectura y Stack Tecnológico

El proyecto está estructurado como un **Monorepo**, dividiendo el sistema en tres áreas principales:

### ⚙️ Backend (`/backend`)
- **Framework:** Java & Spring Boot (Spring Web, Spring Data JPA, Bean Validation).
- **Arquitectura:** Arquitectura en Capas (Layered Architecture: Controllers, Services, Repositories, Entities).
- **Herramientas:** Lombok (reducción de código repetitivo) y SpringDoc OpenAPI (documentación automática con Swagger).
- **Seguridad:** Spring Security implementando autenticación sin estado mediante JSON Web Tokens (JWT).
- **Buenas Prácticas:** Uso estricto de Data Transfer Objects (DTOs) para la transferencia de datos hacia el cliente, aislando el modelo de dominio.

### 🎨 Frontend (`/frontend`)
- **Framework:** Angular & TypeScript.
- **Estilos:** Tailwind CSS y SCSS.
- **Arquitectura:** Standalone Components.
- **Reactividad:** Manejo del estado y la UI utilizando Angular Signals.
- **Seguridad:** Interceptores HTTP para el manejo automático de tokens y Route Guards para protección de vistas.

### 🗄️ Base de Datos (`/database`)
- **Motor:** Microsoft SQL Server.
- **Infraestructura como Código:** Esquemas y scripts de inicialización versionados directamente en el repositorio (`01_init_schema.sql`).
- **Diseño y Reglas de Negocio:**
  - Uso exclusivo de **UUIDs** (`UNIQUEIDENTIFIER`) como Claves Primarias para prevenir la enumeración de endpoints y aumentar la seguridad.
  - **Borrado Lógico (Soft Delete):** Implementado en la tabla de Notas (`eliminada BIT`), evitando la pérdida física y accidental de datos.
  - **Integridad Referencial Inteligente:** Implementación de `ON DELETE SET NULL` en la relación Carpeta-Nota. Si un usuario elimina una carpeta, el sistema preserva las notas huérfanas devolviéndolas a la bandeja principal, optimizando la experiencia de usuario.
  - Almacenamiento escalable de contenido utilizando `NVARCHAR(MAX)`.
