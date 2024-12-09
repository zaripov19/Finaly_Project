<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
    Object object = request.getAttribute("errors");
    Map<String, String> errors = new HashMap<>();
    if (object != null) {
        errors = (Map<String, String>) object;
    }
%>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-lg p-4" style="max-width: 400px; width: 100%;">
        <h1 class="text-center text-primary mb-4">Register</h1>
        <form action="/auth/register" method="post">
            <!-- First Name -->
            <div class="mb-3">
                <label for="firstname" class="form-label">First Name</label>
                <input name="firstname" type="text"
                       class="form-control <%= errors.get("firstName") != null ? "is-invalid" : "" %>"
                       id="firstname" placeholder="Enter your first name">
                <% if (errors.get("firstName") != null) { %>
                <div class="text-danger mt-1"><%= errors.get("firstName") %>
                </div>
                <% } %>
            </div>
            <!-- Last Name -->
            <div class="mb-3">
                <label for="lastname" class="form-label">Last Name</label>
                <input name="lastname" type="text"
                       class="form-control <%= errors.get("lastName") != null ? "is-invalid" : "" %>"
                       id="lastname" placeholder="Enter your last name">
                <% if (errors.get("lastName") != null) { %>
                <div class="text-danger mt-1"><%= errors.get("lastName") %>
                </div>
                <% } %>
            </div>
            <!-- Email -->
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input name="email" type="text"
                       class="form-control <%= errors.get("email") != null ? "is-invalid" : "" %>"
                       id="email" placeholder="Enter your email">
                <% if (errors.get("email") != null) { %>
                <div class="text-danger mt-1"><%= errors.get("email") %>
                </div>
                <% } %>
            </div>
            <!-- Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input name="password" type="password"
                       class="form-control <%= errors.get("password") != null ? "is-invalid" : "" %>"
                       id="password" placeholder="Enter your password">
                <% if (errors.get("password") != null) { %>
                <div class="text-danger mt-1"><%= errors.get("password") %>
                </div>
                <% } %>
            </div>
            <!-- Password Repeat -->
            <div class="mb-3">
                <label for="passwordRepeat" class="form-label">Confirm Password</label>
                <input name="passwordRepeat" type="password"
                       class="form-control <%= errors.get("passwordRepeat") != null ? "is-invalid" : "" %>"
                       id="passwordRepeat" placeholder="Repeat your password">
                <% if (errors.get("passwordRepeat") != null) { %>
                <div class="text-danger mt-1"><%= errors.get("passwordRepeat") %>
                </div>
                <% } %>
            </div>
            <!-- Sign Up Button -->
            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
