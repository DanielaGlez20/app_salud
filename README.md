# NICAMED - Portal Paciente APP

NICAMED es una aplicación móvil orientada a la gestión y visualización del historial de vacunación y la información de salud de los pacientes en Nicaragua. Es una herramienta segura y ágil que permite tanto a pacientes como al personal de salud autorizado gestionar, visualizar y compartir información médica de manera confidencial.

## Funcionalidades Principales

### 1. Registro y Autenticación de Usuarios
- Sistema seguro de autenticación utilizando **JWT tokens** para la gestión de usuarios (pacientes y personal de salud).
- Permite a los pacientes registrarse y acceder a su información personal y de salud.
- Los usuarios autorizados pueden ingresar y gestionar la información de los pacientes.

### 2. Gestión de Historial de Vacunación
- Visualización del esquema completo de vacunación del paciente.
- Acceso a detalles como fechas de vacunación, tipos de vacunas recibidas y dosis administradas.

### 3. Expediente Clínico
- Visualización del historial médico del paciente:
  - Admisiones hospitalarias.
  - Consultas médicas.
  - Diagnósticos y procedimientos realizados.

### 4. Recordatorios de Citas Médicas y Suministro de Medicamentos
- Recordatorios automáticos para citas médicas y medicamentos.
- Notificaciones enviadas por SMS, correo electrónico(se piensa implementar mas adelante) o push notifications.

### 5. Mapa Interactivo de Unidades de Salud
- Ubicación de unidades de salud pública en Nicaragua.
- Información de contacto y servicios disponibles.

### 6. Módulo Educativo
- Recursos educativos sobre salud, nutrición y prevención de enfermedades.
- Formatos de texto, video y audio.

## Tecnologías Utilizadas

### Frontend
- **Flutter** para el desarrollo de la aplicación móvil.
- Animaciones **Lottie** para una experiencia de usuario interactiva.
- Diseño centrado en la experiencia del usuario (UX) con navegación intuitiva.

### Backend
- **Dart** para la lógica de negocio.
- **JWT Tokens** para la autenticación segura.

### Base de Datos
- (Por implementar) Actualmente estamos trabajando en la integración de una base de datos local **SQLite** para gestionar los datos de manera eficiente.

## Configuración del Proyecto

### Requisitos Previos
- **Flutter SDK** 3.5.0 o superior.
- **Dart** 2.18.0 o superior.
- Dependencias del proyecto:
  - `lottie`
  - `google_fonts`
  - `cupertino_icons`

### Instalación y Ejecución
1. Clonar el repositorio:
   ```bash
   git clone https://github.com/JobJarquin/mevak-APP.git
