<%@ page import="uz.pdp.repo.EventRepo" %>
<%@ page import="uz.pdp.entity.Event" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        /* Custom styles for the page */
        .event-image {
            max-width: 150px;
            height: auto;
        }

        .table thead {
            background-color: #343a40;
            color: white;
        }

        .btn-take-part {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        .btn-take-part:disabled {
            background-color: #ccc;
        }

        .alert-success {
            background-color: #28a745;
            color: white;
        }

        .alert-danger {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Available Events</h1>
    <!-- Add Event Button -->
    <div class="text-center mt-4 mp-3">
        <a href="Addevent.jsp" class="btn btn-success">Add Event</a>
        <a href="Report.jsp" class="btn btn-success">Report</a>
        <a href="/login.jsp" class="btn btn-success">Login</a>
    </div>

    <table class="table table-striped table-bordered">
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
            for (Event event : events) {
                int remainingSeats = event.getCount() > 0 ? event.getCount() - 1 : 0;
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
            <td>(<%=remainingSeats%>/<%=event.getCount()%>)</td>
            <td><%=event.getStartTime()%>
            </td>
            <td><%=event.getEndTime()%>
            </td>
            <td>
                <form action="/participate" method="post" id="form_<%=event.getId()%>">
                    <input type="hidden" name="eventId" value="<%=event.getId()%>">
                    <button type="submit" class="btn btn-take-part" id="btn_<%=event.getId()%>"
                            <%= event.getCount() == 0 ? "style='display:none'" : "" %>>
                        Take a part
                    </button>
                </form>
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
