<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Available Events</h1>
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>Image</th>
            <th>Title</th>
            <th>Description</th>
            <th>Speaker</th>
            <th>Pay (USD)</th>
            <th>Seats</th>
            <th>Start Time</th>
            <th>End Time</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <img src="<%=%>" alt="Event Image" class="img-fluid"
                     style="max-width: 150px; height: auto;">
            </td>
            <td>${event.title}</td>
            <td>${event.description}</td>
            <td>${event.speaker}</td>
            <td>${event.pay}</td>
            <td>${event.count}</td>
            <td>${event.startTime}</td>
            <td>${event.endTime}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
