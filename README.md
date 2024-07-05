# Evaluación Spring MVC: Gestión de Tareas

***************************************************************************
************************EVALUACIÓN SPRING-MVC************************
***************************************************************************

Desarrollar una aplicación web de gestión de tareas utilizando Spring MVC. La aplicación permitirá a los usuarios, previo inicio de sesión, realizar las siguientes acciones:

- Crear, visualizar y actualizar tareas.

## Características
- **Estereotipos de Spring:** Utiliza anotaciones como `@Controller`, `@Service`, `@Repository` y `@Component`.
- **Aspectos:** Implementa un aspecto para registrar cada vez que se crea o actualiza una tarea.
- **Atributos de Sesión:** Mantén la información del usuario en la sesión con `@SessionAttributes`.
- **Poblamiento del Modelo:** Utiliza `@ModelAttribute` para poblar el modelo con los datos de las tareas.

## Estructura del Proyecto

### Modelos
- **User:** `username`, `email`, `password`
- **Task:** `id`, `title`, `description`, `status`

### Controladores
- **UserController:** `login`, `logout`
- **TaskController:** `listTasks`, `createTask`, `updateTask`

### Servicios
- **UserService:** Lógica de autenticación del usuario.
- **TaskService:** Lógica de negocio de las tareas.

### Repositorios
- **TaskRepository:** Simulación de persistencia de tareas.
- **UserRepository:** Simulación de persistencia y validación de usuarios.

### Aspecto
- **LoggingAspect:** Registra las actividades de creación y actualización de tareas.

## Requisitos
1. **Estereotipos de Spring:** Anotaciones `@Controller`, `@Service`, `@Repository`, `@Component`.
2. **Aspectos:** Registrar creación y actualización de tareas.
3. **Atributos de Sesión:** Información del usuario con `@SessionAttributes`.
4. **Poblamiento del Modelo:** Datos de tareas con `@ModelAttribute`.


### Diagramas
#### Modelo User
```plaintext
User
├── username
├── email
└── password
```
#### Modelo Task
```plaintext
Task
├── id
├── title
├── description
└── status
```