<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(120deg, #d4fc79, #96e6a1);
            font-family: 'Roboto', sans-serif;
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #3d6a48;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .card-header h1 {
            color: white;
            font-size: 30px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            background-color: #3d6a48;
            border: none;
            padding: 12px;
            font-size: 16px;
            width: 100%;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #4b8b53;
        }

        .text-center a {
            color: #3d6a48;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .text-center a:hover {
            color: #4b8b53;
        }

        .card-body {
            padding: 40px;
        }

        .input-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-lg p-4" style="max-width: 400px; width: 100%;">
        <div class="card-header text-center">
            <h1>Login</h1>
        </div>
        <div class="card-body">
            <form action="/auth/login" method="post">
                <div class="input-group">
                    <span class="input-group-text" id="email-addon"><i class="bi bi-envelope"></i></span>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email"
                           aria-label="Email" aria-describedby="email-addon" required>
                </div>
                <div class="input-group">
                    <span class="input-group-text" id="password-addon"><i class="bi bi-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="Enter your password" aria-label="Password" aria-describedby="password-addon"
                           required>
                </div>
                <button type="submit" class="btn btn-primary">Kirish</button>
                <div class="text-center mt-3">
                    <a href="/register.jsp">Don't have an account? Register</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
