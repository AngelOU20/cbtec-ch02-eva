<%--
  Created by IntelliJ IDEA.
  User: Julio
  Date: 04/07/2024
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Login de Usuario</title>
    <style>
        body, html {
            height: 100%;
        }
        .container {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-form {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .enlace {
            font-weight: 400;
            list-style: none;
            text-decoration: none;
        }
    </style>
</head>
<body>
<section class="container">
    <form class="login-form" action="loginAccion.do"  method="post">
        <h2 class="text-center mb-4">Iniciar Sesión</h2>
        <div class="mb-3">
            <label for="username" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="username"
                   name="username"
                   placeholder="Ingresa tu usuario">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Clave</label>
            <input type="password" class="form-control" id="password"
                   name="password"
                   placeholder="Ingresa tu clave">
        </div>
        <div class="d-grid mt-2">
            <input type="submit" class="btn btn-primary" value="Ingresar">
            <p class="mt-2">¿Aún no tenés cuenta?
                <a class="enlace" href="registerMostrar.do">Registrate</a>
            </p>
        </div>

        <% if (request.getAttribute("msgError") != null) {%>
        <div class="alert alert-danger alert-dismissible fade show mt-3"
             role="alert">
            <strong>Error!</strong> <%= request.getAttribute("msgError")%>
            <button type="button" class="btn-close"
                    data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% }%>

    </form>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
