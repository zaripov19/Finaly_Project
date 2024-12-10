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
    <style>
        /* Custom styles for the page */
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .event-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .event-card:hover {
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-10px);
        }

        .event-image {
            max-width: 100%;
            border-radius: 10px;
            height: 200px;
            object-fit: cover;
        }

        .event-card-header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 15px 15px 0 0;
        }

        .event-card-body {
            padding: 20px;
        }

        .table {
            margin-top: 30px;
        }

        .table th, .table td {
            text-align: center;
        }

        .btn-take-part {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .btn-take-part:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-take-part:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .alert {
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
        }

        .alert-success {
            background-color: #28a745;
            color: white;
        }

        .alert-danger {
            background-color: #dc3545;
            color: white;
        }

        .navbar {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">PDP ACADEMY</a>
        <div class="d-flex">
            <a href="/login.jsp" class="btn btn-success ms-2">Login</a>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center mb-4">PDP ACADEMY</h1>

    <!-- Success or Error Message -->
    <div id="alert-placeholder"></div>

    <div class="row">
        <%
            List<Event> events = EventRepo.getEvents();
            for (Event event : events) {
                int remainingSeats = event.getCount() > 0 ? event.getCount() - 1 : 0;
        %>
        <div class="col-md-4 mb-4">
            <div class="card event-card">
                <img src="<%=event.getPhotoUrl()%>" alt="Event Image" class="event-image">
                <div class="card-header event-card-header">
                    <h5 class="card-title"><%=event.getTitle()%></h5>
                </div>
                <div class="card-body">
                    <p class="card-text"><%=event.getDescription()%></p>
                    <p><strong>Speaker:</strong> <%=event.getSpeaker()%></p>
                    <p><strong>Pay (USD):</strong> <%=event.getPay()%></p>
                    <p><strong>Seats Available:</strong> <%=remainingSeats%> / <%=event.getCount()%></p>
                    <p><strong>Start Time:</strong> <%=event.getStartTime()%></p>
                    <p><strong>End Time:</strong> <%=event.getEndTime()%></p>
                    <form action="/participate" method="post" id="form_<%=event.getId()%>">
                        <input type="hidden" name="eventId" value="<%=event.getId()%>">
                        <button type="submit" class="btn btn-take-part" id="btn_<%=event.getId()%>">
                            Take Part
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
