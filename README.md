# Borrador.ar 📝

Borrador.ar es una aplicación web Single Page Application (SPA) minimalista para la creación y gestión rápida de notas. El proyecto está diseñado con un enfoque fuerte en escalabilidad, rendimiento y estándares de la industria.

## 🚀 Arquitectura y Stack Tecnológico

El proyecto está estructurado como un **Monorepo**, dividiendo el sistema en dos áreas principales:

### ⚙️ Backend (`/backend`)
- **Framework:** Java & Spring Boot.
- **Arquitectura:** Monolito Modular basado en capas (Layered Architecture).
- **Base de Datos:** SQL relacional.
- **Seguridad:** Spring Security implementando autenticación sin estado mediante JSON Web Tokens (JWT).
- **Buenas Prácticas:** Uso estricto de Data Transfer Objects (DTOs), identificadores UUID y Soft Deletes (borrado lógico).

### 🎨 Frontend (`/frontend`)
- **Framework:** Angular & TypeScript.
- **Arquitectura:** Standalone Components.
- **Reactividad:** Manejo del estado y la UI utilizando Angular Signals.
- **Seguridad:** Interceptores HTTP para el manejo automático de tokens y Route Guards para protección de vistas.
