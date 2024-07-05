<%--
  Created by IntelliJ IDEA.
  User: Julio
  Date: 04/07/2024
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Registro de Usuario</title>
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
        .register-form {
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
    <mvc:form cssClass="register-form" modelAttribute="userBean"
              action="registerAccion.do" method="post">

        <h2 class="text-center mb-4">Registro de Usuario</h2>

        <div class="mb-3">
            <mvc:label path="username" cssClass="form-label">Usuario</mvc:label>
            <mvc:input path="username" type="text" cssClass="form-control"
                       id="username" name="username" placeholder="Ingresa tu usuario" />
            <mvc:errors path="username" cssClass="text-danger text-uppercase mt-2" />
        </div>

        <div class="mb-3">
            <mvc:label path="email" cssClass="form-label">Correo Electrónico</mvc:label>
            <mvc:input path="email" type="email" cssClass="form-control"
                       id="email" name="email" placeholder="Ingresa tu correo electrónico" />
            <mvc:errors path="email" cssClass="text-danger text-uppercase mt-2" />
        </div>
        <div class="mb-3">
            <mvc:label path="password" cssClass="form-label">Clave</mvc:label>
            <mvc:input path="password" type="password" cssClass="form-control"
                       id="password" name="password" placeholder="Ingresa tu clave" />
            <mvc:errors path="password" cssClass="text-danger text-uppercase mt-2" />
        </div>
        <div class="d-grid mt-2">
            <input type="submit" class="btn btn-primary" value="Registrarse">
            <p class="mt-2">¿Ya tienes una cuenta?
                <a class="enlace" href="loginMostrar.do">Iniciar sesión</a>
            </p>
        </div>
    </mvc:form>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
