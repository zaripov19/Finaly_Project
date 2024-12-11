<%@ page import="uz.pdp.repo.EventRepo" %>
<%@ page import="uz.pdp.entity.Event" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">PDP ACADEMY</a>
        <div class="d-flex">
            <a href="/login.jsp" class="btn btn-light ms-2">Login</a>
        </div>
    </div>
</nav>

<div class="container my-5">
    <h1 class="text-center mb-4">Upcoming Events</h1>

    <!-- Success or Error Message -->
    <div id="alert-placeholder"></div>

    <!-- Table for Events -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Event Image</th>
            <th scope="col">Event Title</th>
            <th scope="col">Speaker</th>
            <th scope="col">Pay (USD)</th>
            <th scope="col">Seats Available</th>
            <th scope="col">Start Time</th>
            <th scope="col">End Time</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Event> events = EventRepo.getEvents();
            for (Event event : events) {
                int remainingSeats = event.getCount() > 0 ? event.getCount() : 0;
        %>
        <tr>
            <td><img src="<%= event.getPhotoUrl() %>" alt="Event Image"
                     style="width: 100px; height: 100px; object-fit: cover;"></td>
            <td><%= event.getTitle() %>
            </td>
            <td><%= event.getSpeaker() %>
            </td>
            <td><%= event.getPay() %>
            </td>
            <td><%= remainingSeats %> / <%= event.getCount() %>
            </td>
            <td><%= event.getStartTime() %>
            </td>
            <td><%= event.getEndTime() %>
            </td>
            <td>
                <form action="/participate" method="post">
                    <input type="hidden" name="eventId" value="<%= event.getId() %>">
                    <button type="submit" class="btn btn-primary">
                        Take Part
                    </button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
