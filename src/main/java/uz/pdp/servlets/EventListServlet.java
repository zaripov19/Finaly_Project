package uz.pdp.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.entity.Event;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static uz.pdp.config.MyListener.EMF;

@WebServlet("/events")
public class EventListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            List<Event> events = entityManager.createQuery("SELECT e FROM Event e", Event.class).getResultList();
            req.setAttribute("events", events);
            req.getRequestDispatcher("event.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}
