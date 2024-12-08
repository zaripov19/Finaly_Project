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

            if (event != null) {
                // Eventda o'rindiq borligini tekshirish
                if (event.getCount() > 0) {
                    // O'rindiqlarni kamaytirish
                    event.setCount(event.getCount() - 1);

                    // Eventni yangilash
                    entityManager.getTransaction().begin();
                    entityManager.merge(event);
                    entityManager.getTransaction().commit();

                    // Ro'yxatga olish muvaffaqiyatli bo'lsa, foydalanuvchini muvaffaqiyat sahifasiga yo'naltirish
                    resp.sendRedirect("event.jsp?success=true");
                } else {
                    // O'rindiqlar tugagan bo'lsa, xato xabarini ko'rsatish
                    resp.sendRedirect("event.jsp?error=noSeats");
                }
            } else {
                // Event topilmasa xato xabarini ko'rsatish
                resp.sendRedirect("event.jsp?error=eventNotFound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("event.jsp?error=serverError");
        }
    }
}