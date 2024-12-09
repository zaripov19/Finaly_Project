<%@ page import="uz.pdp.entity.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.repo.EventRepo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        .table th, .table td {
            text-align: center;
        }

        .btn-back {
            background-color: #28a745;
            color: white;
            font-weight: bold;
        }

        .event-image {
            max-width: 100px;
            height: auto;
        }

        .total-balance {
            font-weight: bold;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Event Report</h1>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Event Image</th>
            <th>Event Title</th>
            <th>Event Description</th>
            <th>Event Speaker</th>
            <th>Total Seats</th>
            <th>Total Pay (USD)</th>
            <th>Event Start</th>
            <th>Event End</th>
        </tr>
        </thead>
        <tbody>
        <%
            double totalBalance = 0; // Umumiy balansni saqlash uchun o'zgaruvchi
            List<Event> events = EventRepo.getEvents();
            for (Event event : events) {
                double totalPay = event.getCount() * event.getPay();  // Barcha o'rindiqlar bo'yicha umumiy to'lov
                totalBalance += totalPay; // Umumiy balansni yangilash
        %>
        <tr>
            <td><img src="<%= event.getPhotoUrl() %>" alt="Event Image" class="event-image"></td>
            <td><%= event.getTitle() %>
            </td>
            <td><%= event.getDescription() %>
            </td>
            <td><%= event.getSpeaker() %>
            </td>
            <td><%= event.getCount() %>
            </td>
            <td><%= totalPay %>
            </td>
            <td><%= event.getStartTime() %>
            </td>
            <td><%= event.getEndTime() %>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <!-- Total Balance -->
    <div class="total-balance text-center">
        <p>Total Balance: <%= totalBalance %> USD</p>
    </div>

    <!-- Button to return to the Event List page -->
    <div class="text-center mt-4">
        <a href="Adminevent.jsp" class="btn btn-back">Back to Events</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
