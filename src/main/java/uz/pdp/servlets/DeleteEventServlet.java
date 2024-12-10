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
        String id = req.getParameter("eventId");

        if (id != null && !id.isEmpty()) {
            try (EntityManager entityManager = EMF.createEntityManager()) {
                Long eventId = Long.parseLong(id); // Integer o'rniga Long.parseLong() ishlatish kerak
                Event event = entityManager.find(Event.class, eventId);

                if (event != null) {
                    entityManager.getTransaction().begin();
                    entityManager.remove(event); // Eventni olib tashlash
                    entityManager.getTransaction().commit();
                    resp.sendRedirect("/Adminevent.jsp"); // Eventni o'chirgandan keyin sahifaga qaytish
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Event topilmadi."); // Agar event topilmasa
                }
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Event ID noto'g'ri formatda."); // ID noto'g'ri formatda bo'lsa
            } catch (Exception e) {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Xatolik yuz berdi.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Event ID kiritilmagan.");
        }
    }
}
