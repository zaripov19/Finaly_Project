<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Room Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(120deg, #6a11cb, #2575fc);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .navbar {
            background-color: #343a40 !important;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
        }

        .container {
            margin-top: 50px;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #4e73df;
            margin-bottom: 30px;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .form-container:hover {
            transform: translateY(-5px);
        }

        .form-control {
            border-radius: 10px;
            box-shadow: none;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.6);
            border-color: #007bff;
        }

        .form-label {
            font-weight: 600;
            color: #444;
        }

        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
            font-weight: bold;
            padding: 12px 30px;
            border-radius: 50px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #3e64c3;
            border-color: #3e64c3;
        }

        .btn-primary:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.6);
        }

        .form-container .btn {
            width: 100%;
        }

        .navbar a {
            color: #fff !important;
        }

        .navbar a:hover {
            color: #4e73df !important;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            padding: 10px 0;
            background-color: #343a40;
            color: #fff;
        }

        .footer p {
            margin: 0;
        }

        .footer a {
            color: #4e73df;
        }

        .footer a:hover {
            color: #3e64c3;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Event Room</a>
    </div>
</nav>

<div class="container">
    <h1 class="text-center"> PDP Event Room Registration</h1>
    <form action="/add" method="post" enctype="multipart/form-data" class="form-container">
        <div class="mb-4">
            <label for="title" class="form-label">Event Title</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter event title" required>
        </div>

        <div class="mb-4">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="4" placeholder="Enter event description" required></textarea>
        </div>

        <div class="mb-4">
            <label for="speaker" class="form-label">Speaker</label>
            <input type="text" class="form-control" id="speaker" name="speaker" placeholder="Enter speaker name" required>
        </div>

        <div class="mb-4">
            <label for="pay" class="form-label">Payment (in USD)</label>
            <input type="number" class="form-control" id="pay" name="pay" placeholder="Enter payment amount" required>
        </div>

        <div class="mb-4">
            <label for="count" class="form-label">Number of Seats</label>
            <input type="number" class="form-control" id="count" name="count" placeholder="Enter number of seats" required>
        </div>

        <div class="mb-4">
            <label for="startTime" class="form-label">Start Time</label>
            <input type="datetime-local" class="form-control" id="startTime" name="startTime" required>
        </div>

        <div class="mb-4">
            <label for="endTime" class="form-label">End Time</label>
            <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
        </div>

        <div class="mb-4">
            <label for="image" class="form-label">Upload Event Image</label>
            <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
</div>

<div class="footer">
    <p>&copy; 2024 Event Room. All Rights Reserved. | <a href="#">Privacy Policy</a></p>
</div>

<script>
    document.querySelector("form").addEventListener("submit", function(event) {
        var startTime = document.getElementById("startTime").value;
        var endTime = document.getElementById("endTime").value;

        if (new Date(startTime) >= new Date(endTime)) {
            alert("End time must be later than start time.");
            event.preventDefault();
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
