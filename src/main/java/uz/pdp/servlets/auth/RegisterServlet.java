package uz.pdp.servlets.auth;

import jakarta.persistence.EntityManager;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import uz.pdp.entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import static uz.pdp.config.MyListener.EMF;

@WebServlet("/auth/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstname");
        String lastName = req.getParameter("lastname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String passwordRepeat = req.getParameter("passwordRepeat");

        // Parollarni tekshirish
        if (!password.equals(passwordRepeat)) {
            req.setAttribute("errorMessage", "Parollar bir xil bo'lishi kerak");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        // Email orqali foydalanuvchi mavjudligini tekshirish
        try (EntityManager entityManager = EMF.createEntityManager()) {
            Users existingUser = entityManager.createQuery("FROM Users WHERE email = :email", Users.class)
                    .setParameter("email", email)
                    .getResultList().stream().findFirst().orElse(null);

            if (existingUser != null) {
                req.setAttribute("errorMessage", "Bu email manzil bilan foydalanuvchi mavjud");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }


            Users user = new Users(firstName, lastName, email, password);


            Map<String, String> map = new HashMap<>();
            Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
            Set<ConstraintViolation<Users>> validate = validator.validate(user);
            for (ConstraintViolation<Users> validation : validate) {
                map.put(validation.getPropertyPath().toString(), validation.getMessage());
            }

            if (!validate.isEmpty()) {
                req.setAttribute("errors", map);
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }

            // Foydalanuvchini saqlash
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();

            // Login sahifasiga yo'naltirish
            resp.sendRedirect("/login.jsp");

        } catch (Exception e) {
            req.setAttribute("errorMessage", "Ro'yxatdan o'tishda xatolik yuz berdi: " + e.getMessage());
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
