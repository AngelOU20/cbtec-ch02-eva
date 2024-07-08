<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Página de inicio</title>
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
    <img src="https://www.tutorialspoint.com/bootstrap/images/slide1.png"
         class="img-fluid d-block w-100" alt="image">
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

</body>
</html>
