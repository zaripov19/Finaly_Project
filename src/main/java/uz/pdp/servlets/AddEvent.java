package uz.pdp.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.entity.Event;
import uz.pdp.entity.UserRole;
import uz.pdp.entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import static uz.pdp.config.MyListener.EMF;

@WebServlet("/add")
@MultipartConfig // Fayl yuklashni qo'llab-quvvatlash uchun
public class AddEvent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            // Ma'lumotlarni formadan olish
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            String speaker = req.getParameter("speaker");
            Integer pay = Integer.parseInt(req.getParameter("pay"));
            Integer count = Integer.parseInt(req.getParameter("count"));

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime startTime = LocalDateTime.parse(req.getParameter("startTime"), formatter);
            LocalDateTime endTime = LocalDateTime.parse(req.getParameter("endTime"), formatter);

            // Fayl yuklash va saqlash
            Part filePart = req.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = getServletContext().getRealPath("") + "uploads";
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdir(); // Papkani yaratish
            }
            String photoUrl = "uploads/" + fileName;
            filePart.write(uploadDir + File.separator + fileName);

            // Event obyektini yaratish
            Event event = new Event(title, description, speaker, pay, count, startTime, endTime, photoUrl);

            // Ma'lumotlarni saqlash
            entityManager.getTransaction().begin();
            entityManager.persist(event);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/Adminevent.jsp");
        } catch (Exception e) {
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}
