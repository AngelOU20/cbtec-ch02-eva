# Evaluación Spring MVC - Gestión de Tareas

Este proyecto es una aplicación web de gestión de tareas utilizando Spring MVC. La aplicación permite a los usuarios, previo inicio de sesión, crear, visualizar y actualizar tareas.

## Requisitos

- **Estereotipos de Spring:** Utiliza anotaciones como `@Controller`, `@Service`, `@Repository` y `@Component` para definir los componentes de la aplicación.
- **Aspectos:** Implementa un aspecto para registrar cada vez que se crea o actualiza una tarea.
- **Atributos de Sesión:** Mantén la información del usuario en la sesión utilizando `@SessionAttributes`.
- **Poblamiento del Modelo:** Utiliza `@ModelAttribute` para poblar el modelo con los datos de las tareas.

## Instrucciones

### Estructura del Proyecto

- **Modelos:**
    - `User`: Representa la información del usuario.
        - Atributos: `username`, `email`, `password`
    - `Task`: Representa una tarea con atributos como `id`, `title`, `description` y `status`.

- **Controladores:**
    - `UserController`: Maneja las solicitudes relacionadas con el usuario.
        - Métodos: `login`, `logout`
    - `TaskController`: Maneja las solicitudes relacionadas con las tareas.
        - Métodos: `listTasks`, `createTask`, `updateTask`

- **Servicios:**
    - `UserService`: Contiene la lógica de negocio relacionada con el usuario.
        - Métodos para manejar la lógica de autenticación del usuario.
    - `TaskService`: Contiene la lógica de negocio relacionada con las tareas.
        - Métodos para manejar la lógica de negocio de las tareas.

- **Repositorios:**
    - `TaskRepository`: Simula el acceso a la base de datos para las tareas.
        - Métodos para simular la persistencia de tareas.
    - `UserRepository`: Simula la validación de un usuario en BBDD.
        - Métodos para simular la persistencia y validación de usuario.

- **Aspecto:**
    - `LoggingAspect`: Registra las actividades de creación y actualización de tareas.
