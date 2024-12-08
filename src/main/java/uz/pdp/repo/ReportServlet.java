package uz.pdp.repo;

import uz.pdp.entity.Event;

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
        // Tadbirlar ro'yxatini olish
        List<Event> events = EventRepo.getEvents();

        // Hisobotni yaratish
        double totalIncome = 0;
        for (Event event : events) {
            int seatsTaken = event.getCount();  // O'rindiqlarni hisoblash
            totalIncome += seatsTaken * event.getPay();  // Umumiy to'lovni hisoblash
        }

        // Hisobotni requestga yuborish
        request.setAttribute("events", events);
        request.setAttribute("totalIncome", totalIncome);

        // JSP sahifasini ko'rsatish
        request.getRequestDispatcher("/Report.jsp").forward(request, response);
    }
}
