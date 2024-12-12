<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    Object object = request.getAttribute("errors");
    Map<String, String> errors = new HashMap<>();
    if (object != null) {
        errors = (Map<String, String>) object;
    }
%>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-sm w-100" style="max-width: 500px;">
        <div class="card-header bg-success text-white text-center">
            <h1>Register</h1>
        </div>
        <div class="card-body">
            <form action="/auth/register" method="post">
                <div class="mb-3">
                    <label for="firstname" class="form-label">First Name</label>
                    <input name="firstname" type="text" class="form-control <%= errors.get("firstName") != null ? "is-invalid" : "" %>" id="firstname" placeholder="Enter your first name">
                    <% if (errors.get("firstName") != null) { %>
                    <span class="invalid-feedback d-block"><%= errors.get("firstName") %></span>
                    <% } %>
                </div>
                <div class="mb-3">
                    <label for="lastname" class="form-label">Last Name</label>
                    <input name="lastname" type="text" class="form-control <%= errors.get("lastName") != null ? "is-invalid" : "" %>" id="lastname" placeholder="Enter your last name">
                    <% if (errors.get("lastName") != null) { %>
                    <span class="invalid-feedback d-block"><%= errors.get("lastName") %></span>
                    <% } %>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input name="email" type="text" class="form-control <%= errors.get("email") != null ? "is-invalid" : "" %>" id="email" placeholder="Enter your email">
                    <% if (errors.get("email") != null) { %>
                    <span class="invalid-feedback d-block"><%= errors.get("email") %></span>
                    <% } %>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input name="password" type="password" class="form-control <%= errors.get("password") != null ? "is-invalid" : "" %>" id="password" placeholder="Enter your password">
                    <% if (errors.get("password") != null) { %>
                    <span class="invalid-feedback d-block"><%= errors.get("password") %></span>
                    <% } %>
                </div>
                <div class="mb-3">
                    <label for="passwordRepeat" class="form-label">Confirm Password</label>
                    <input name="passwordRepeat" type="password" class="form-control <%= errors.get("passwordRepeat") != null ? "is-invalid" : "" %>" id="passwordRepeat" placeholder="Repeat your password">
                    <% if (errors.get("passwordRepeat") != null) { %>
                    <span class="invalid-feedback d-block"><%= errors.get("passwordRepeat") %></span>
                    <% } %>
                </div>
                <button type="submit" class="btn btn-success w-100">Sign Up</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>