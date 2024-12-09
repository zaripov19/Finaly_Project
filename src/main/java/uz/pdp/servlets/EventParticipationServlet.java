package uz.pdp.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.entity.Event;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.config.MyListener.EMF;

@WebServlet("/participate")
public class EventParticipationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Eventni ID asosida olish
        String eventIdStr = req.getParameter("eventId");
        Long eventId = Long.valueOf(eventIdStr);

        try (EntityManager entityManager = EMF.createEntityManager()) {
            // Eventni topish
            Event event = entityManager.find(Event.class, eventId);
            entityManager.getTransaction().begin();
            int a = (int) (event.getCount() - eventId);
            event.setCount(a);
            entityManager.persist(event);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/event.jsp");
        }
    }
}