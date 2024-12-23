<%@ page import="uz.pdp.repo.EventRepo" %>
<%@ page import="uz.pdp.entity.Event" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pdp Academy Event Room </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .event-image {
            max-width: 150px;
            height: auto;
            border-radius: 8px;
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-take-part {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .btn-take-part:hover {
            background-color: #0056b3;
        }

        .btn-take-part:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .btn-container {
            text-align: center;
            margin-bottom: 30px;
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

        .navbar-brand {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="text-center mb-4">Pdp Academy Event Room </h1>

    <div class="btn-container">
        <a href="Addevent.jsp" class="btn btn-success me-2">Add Event</a>
        <a href="Report.jsp" class="btn btn-info me-2"> Report</a>
    </div>

    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>Image</th>
            <th>Title</th>
            <th>Description</th>
            <th>Speaker</th>
            <th>Pay (USD)</th>
            <th>Seats</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Event> events = EventRepo.getEvents();
            if (events != null) {
                for (Event event : events) {
        %>
        <tr>
            <td>
                <img src="<%=event.getPhotoUrl()%>" alt="Event Image" class="event-image">
            </td>
            <td><%=event.getTitle()%>
            </td>
            <td><%=event.getDescription()%>
            </td>
            <td><%=event.getSpeaker()%>
            </td>
            <td><%=event.getPay()%>
            </td>
            <td><%=event.getCount()%>
            </td>
            <td><%=event.getStartTime()%>
            </td>
            <td><%=event.getEndTime()%>
            </td>
            <td>
                <form action="/admin/delete" method="post">
                    <input type="hidden" name="eventId" value="<%=event.getId()%>">
                    <button type="submit" class="btn btn-danger btn-take-part">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
