<%@ page import="java.util.List" %>
<%@ page import="edu.cibertec.capitulo02evaluacion.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Administrar tareas</title>
    <style>
        .navbar {
            padding: 1rem 2rem;
        }
        .avatar {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 50%;
            object-fit: cover;
        }
        .dropdown-toggle::after {
            display: none;
        }
        .card {
            min-height: 10rem;
            min-width: 22.25rem;
            border-radius: 1rem;
            border: 1px solid #e0e0e0;
            box-shadow: 0 0.1rem 1rem rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            padding: 1rem;
            transition: box-shadow 0.3s ease-in-out;
            position: relative;
        }
        .card:hover {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.2);
        }
        .card-status {
            border-radius: 0.5rem;
            padding: 0.25rem 0.75rem;
            display: inline-block;
            font-size: 0.875rem;
            position: absolute;
            bottom: 1rem;
            right: 1rem;
        }
        .status-pendiente {
            background-color: #fff3cd;
            color: #856404;
        }
        .status-enprogreso {
            background-color: #cce5ff;
            color: #004085;
        }
        .status-completada {
            background-color: #d4edda;
            color: #155724;
        }
        .dropdown-menu-right {
            right: 0;
            left: auto;
        }
        .dropdown-toggle::after {
            display: none;
        }
        .card-menu {
            position: absolute;
            top: 1rem;
            right: 1rem;
        }
        .icon {
            color: #11131c;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
    <div class="container">
        <a class="navbar-brand" href="home.do">TaskManager</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="taskMostrar.do">Administrar tareas
                    </a>
                </li>
            </ul>
        </div>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle d-flex align-items-center"
                   href="#" id="userDropdown" role="button"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="me-2">${sessionScope.currentUser.getUsername()}</span>
                    <img src="https://avatars.githubusercontent.com/u/76443525?v=4"
                         alt="User Avatar" class="avatar shadow-4">
                </a>
                <ul class="dropdown-menu dropdown-menu-end"
                    aria-labelledby="userDropdown">
                    <li>
                        <a class="dropdown-item py-3 pe-5" href="#">
                            <i class="fa-solid fa-user me-3"></i>Mi perfil
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item py-3 pe-5" href="#">
                            <i class="fa-solid fa-gear me-3"></i>Configuración
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item py-3 pe-5"
                           href="logoutAccion.do">
                            <i class="fa-solid fa-right-from-bracket me-3"></i>Cerrar Sesión
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<section class="container">
    <h1 class="text-center mb-4">Lista de tareas</h1>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary px-2 mb-4"
            data-bs-toggle="modal" data-bs-target="#createTaskModal">
        Crear tarea
    </button>

    <!-- Save Modal -->
    <div class="modal fade" id="createTaskModal" tabindex="-1" aria-labelledby="createTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="createTaskModalLabel">Crear nueva tarea</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <mvc:form id="createTaskForm" cssClass="register-form"
                              modelAttribute="taskBean" action="taskCrear.do">
                        <div class="mb-3">
                            <mvc:label path="title" cssClass="form-label">Título</mvc:label>
                            <mvc:input path="title" type="text" cssClass="form-control" id="taskTitle" />
                            <mvc:errors path="title" cssClass="text-danger text-uppercase mt-2" />
                        </div>
                        <div class="mb-3">
                            <mvc:label path="description" cssClass="form-label">Descripción</mvc:label>
                            <mvc:textarea path="description" cssClass="form-control" id="taskDescription" rows="3" />
                            <mvc:errors path="description" cssClass="text-danger text-uppercase mt-2" />
                        </div>
                        <div class="mb-3">
                            <mvc:label path="status" cssClass="form-label">Estado</mvc:label>
                            <mvc:select path="status" cssClass="form-select" id="taskStatus">
                                <option value="Pendiente">Pendiente</option>
                                <option value="En progreso">En progreso</option>
                                <option value="Completada">Completada</option>
                            </mvc:select>
                            <mvc:errors path="status" cssClass="text-danger text-uppercase mt-2" />
                        </div>
                    </mvc:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" form="createTaskForm" class="btn btn-primary">
                        <i class="fas fa-save"></i> Insertar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Lista de tareas -->
    <% List<Task> taskList = (List<Task>) request.getAttribute("tasks"); %>
    <div class="row">
        <% for (Task task : taskList) { %>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%= task.getTitle() %></h5>
                    <p class="card-text"><%= task.getDescription() %></p>
                    <span class="<%= task.getStatus().equals("Pendiente") ? "status-pendiente" : task.getStatus().equals("En progreso") ? "status-enprogreso" : "status-completada" %> card-status">
                        <%= task.getStatus() %>
                    </span>
                    <div class="dropdown card-menu">
                        <button class="btn btn-link dropdown-toggle" type="button"
                                id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-ellipsis-v icon"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                            <li>
                                <a class="dropdown-item"
                                   href="taskVer.do?id=<%= task.getId() %>">Ver
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item"
                                   href="taskEditar.do?id=<%= task.getId() %>">Editar</a>
                            </li>
                            <li>
                                <a class="dropdown-item"
                                   href="taskEliminar.do?id=<%= task.getId() %>">Eliminar</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
