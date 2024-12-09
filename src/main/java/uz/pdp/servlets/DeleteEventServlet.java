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

@WebServlet("/admin/delete")
public class DeleteEventServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            String id = req.getParameter("eventId");
            Integer eventId = Integer.parseInt(id);
            entityManager.getTransaction().begin();
            Event event = entityManager.find(Event.class, eventId);
            entityManager.remove(event);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/Adminevent.jsp");
        }
    }
}
