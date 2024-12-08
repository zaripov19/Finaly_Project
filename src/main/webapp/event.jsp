<%@ page import="uz.pdp.repo.EventRepo" %>
<%@ page import="uz.pdp.entity.Event" %>
<%@ page import="java.util.List" %>
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
        <%
            List<Event> events = EventRepo.getEvents();
            for (Event event : events) {
        %>

        <tr>
            <td>
                <img src="<%=event.getPhotoUrl()%>" alt="Event Image" class="img-fluid"
                     style="max-width: 150px; height: auto;">
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
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
