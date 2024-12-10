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
        body {
            background-color: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
            padding: 15px;
        }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }

        .event-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #4e73df;
        }

        .total-balance {
            font-size: 1.5rem;
            font-weight: 600;
            color: #333;
            margin-top: 20px;
        }

        .btn-back {
            background-color: #4e73df;
            color: white;
            font-weight: bold;
            padding: 12px 25px;
            border-radius: 50px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #3e64c3;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #343a40;
            color: white;
            margin-top: 40px;
        }

        .footer a {
            color: #4e73df;
            text-decoration: none;
        }

        .footer a:hover {
            color: #3e64c3;
        }
    </style>
</head>

<body>

<div class="container">
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
            <td><%= event.getTitle() %></td>
            <td><%= event.getDescription() %></td>
            <td><%= event.getSpeaker() %></td>
            <td><%= event.getCount() %></td>
            <td><%= totalPay %></td>
            <td><%= event.getStartTime() %></td>
            <td><%= event.getEndTime() %></td>
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
        <a href="Adminevent.jsp" class="btn-back">Back to Events</a>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Event Room. All Rights Reserved. | <a href="#">Privacy Policy</a></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
