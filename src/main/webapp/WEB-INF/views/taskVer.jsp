<%@ page import="edu.cibertec.capitulo02evaluacion.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<html lang="es">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <title>Ver Tarea</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #2c3e50;
        }
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
        .task-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .task-container h1 {
            color: #3498db;
            text-align: center;
            margin-bottom: 1rem;
        }
        .task-container .form-label {
            font-weight: bold;
            color: #7f8c8d;
        }
        .task-container p {
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 5px;
        }
        .btn-back {
            display: inline-flex;
            align-items: center;
            background-color: #3498db;
            color: #ffffff;
            border: none;
        }
        .btn-back:hover {
            background-color: #2980b9;
        }
        .btn-back i {
            margin-right: 5px;
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
                    <a class="nav-link active" aria-current="page" href="taskMostrar.do">Administrar tareas</a>
                </li>
            </ul>
        </div>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="me-2">${sessionScope.currentUser.getUsername()}</span>
                    <img src="https://avatars.githubusercontent.com/u/76443525?v=4" alt="User Avatar" class="avatar shadow-4">
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
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
                        <a class="dropdown-item py-3 pe-5" href="logoutAccion.do">
                            <i class="fa-solid fa-right-from-bracket me-3"></i>Cerrar Sesión
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<section class="container">
    <div class="task-container">
        <h1>Ver Tarea</h1>
        <div class="mb-3">
            <label class="form-label">Título:</label>
            <p>${task.getTitle()}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción:</label>
            <p>${task.getDescription()}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">Estado:</label>
            <p>${task.getStatus()}</p>
        </div>
        <a href="taskMostrar.do" class="btn btn-primary">
            <i class="fas fa-arrow-left me-2"></i> Regresar
        </a>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
