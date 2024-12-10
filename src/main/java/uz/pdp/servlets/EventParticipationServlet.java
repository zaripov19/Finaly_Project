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
        // Event ID-ni so'rovdan olish
        String eventIdStr = req.getParameter("eventId");
        Long eventId = Long.valueOf(eventIdStr);

        try (EntityManager entityManager = EMF.createEntityManager()) {
            // Eventni ID bo'yicha qidirish
            Event event = entityManager.find(Event.class, eventId);

            if (event != null) {
                // Transaction boshlash
                entityManager.getTransaction().begin();

                // O'rindiqni 1 taga kamaytirish (bir ishtirokchi qo'shilyapti)
                int newCount = event.getCount() - 1;

                // Yangilangan count qiymatini saqlash
                event.setCount(newCount);

                // Yangilangan event ob'ektini bazaga saqlash
                entityManager.merge(event);

                // Transactionni tugatish
                entityManager.getTransaction().commit();

                // Event sahifasiga qayta yo'naltirish
                resp.sendRedirect("/event.jsp");
            } else {
                // Agar event topilmasa, xatolik qaytarish
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Event topilmadi.");
            }
        } catch (Exception e) {
            // Xatolik yuzaga kelsa, transactionni orqaga qaytarish va xato haqida xabar yuborish
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "So'rovni ishlashda xatolik yuz berdi.");
        }
    }
}
