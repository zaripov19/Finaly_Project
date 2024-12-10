<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f7f6;
            font-family: 'Arial', sans-serif;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #4CAF50;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .card-header h1 {
            color: white;
            font-size: 30px;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-primary {
            background-color: #4CAF50;
            border: none;
            padding: 12px;
            font-size: 16px;
            width: 100%;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }

        .text-center a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .text-center a:hover {
            color: #45a049;
        }

        .card-body {
            padding: 40px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .invalid-feedback {
            display: block;
        }
    </style>
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
    <div class="card shadow-lg p-4" style="max-width: 500px; width: 100%;">
        <div class="card-header text-center">
            <h1>Register</h1>
        </div>
        <div class="card-body">
            <form action="/auth/register" method="post">
                <!-- First Name -->
                <div class="mb-3">
                    <label for="firstname" class="form-label">First Name</label>
                    <input name="firstname" type="text"
                           class="form-control <%= errors.get("firstName") != null ? "is-invalid" : "" %>"
                           id="firstname" placeholder="Enter your first name">
                    <% if (errors.get("firstName") != null) { %>
                    <div class="invalid-feedback"><%= errors.get("firstName") %>
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
                    <div class="invalid-feedback"><%= errors.get("lastName") %>
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
                    <div class="invalid-feedback"><%= errors.get("email") %>
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
                    <div class="invalid-feedback"><%= errors.get("password") %>
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
                    <div class="invalid-feedback"><%= errors.get("passwordRepeat") %>
                    </div>
                    <% } %>
                </div>
                <!-- Sign Up Button -->
                <button type="submit" class="btn btn-primary">Sign Up</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
