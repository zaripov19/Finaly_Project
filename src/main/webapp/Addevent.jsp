<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Room Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">Event Room</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <h1 class="text-center text-primary mb-4">Event Room Registration</h1>
    <form action="/addadmin" method="post" enctype="multipart/form-data" class="p-4 bg-white shadow rounded">
        <!-- Title -->
        <div class="mb-3">
            <label for="title" class="form-label">Event Title</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter event title" required>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3"
                      placeholder="Enter event description" required></textarea>
        </div>

        <!-- Speaker -->
        <div class="mb-3">
            <label for="speaker" class="form-label">Speaker</label>
            <input type="text" class="form-control" id="speaker" name="speaker" placeholder="Enter speaker name"
                   required>
        </div>

        <!-- Payment -->
        <div class="mb-3">
            <label for="pay" class="form-label">Payment (in USD)</label>
            <input type="number" class="form-control" id="pay" name="pay" placeholder="Enter payment amount" required>
        </div>

        <!-- Seat Count -->
        <div class="mb-3">
            <label for="count" class="form-label">Number of Seats</label>
            <input type="number" class="form-control" id="count" name="count" placeholder="Enter number of seats"
                   required>
        </div>

        <!-- Start Time -->
        <div class="mb-3">
            <label for="startTime" class="form-label">Start Time</label>
            <input type="datetime-local" class="form-control" id="startTime" name="startTime" required>
        </div>

        <!-- End Time -->
        <div class="mb-3">
            <label for="endTime" class="form-label">End Time</label>
            <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
        </div>

        <!-- Upload Image -->
        <div class="mb-3">
            <label for="image" class="form-label">Upload Event Image</label>
            <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary btn-lg">Register</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
