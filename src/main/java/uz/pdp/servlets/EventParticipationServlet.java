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

        String eventIdStr = req.getParameter("eventId");
        Long eventId = Long.valueOf(eventIdStr);

        try (EntityManager entityManager = EMF.createEntityManager()) {

            Event event = entityManager.find(Event.class, eventId);

            if (event != null) {

                entityManager.getTransaction().begin();

                int newCount = event.getCount() - 1;

                event.setCount(newCount);

                entityManager.merge(event);

                entityManager.getTransaction().commit();

                resp.sendRedirect("/event.jsp");
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Event topilmadi.");
            }
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "So'rovni ishlashda xatolik yuz berdi.");
        }
    }
}