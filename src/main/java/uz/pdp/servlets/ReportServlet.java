package uz.pdp.servlets;

import uz.pdp.entity.Event;
import uz.pdp.repo.EventRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Event> events = EventRepo.getEvents();

        double totalIncome = 0;
        for (Event event : events) {
            int seatsTaken = event.getCount();
            totalIncome += seatsTaken * event.getPay();
        }

        request.setAttribute("events", events);
        request.setAttribute("totalIncome", totalIncome);

        request.getRequestDispatcher("/Report.jsp").forward(request, response);
    }
}
