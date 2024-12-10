package uz.pdp.servlets.auth;

import jakarta.persistence.EntityManager;
import uz.pdp.entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.config.MyListener.EMF;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (EntityManager entityManager = EMF.createEntityManager()) {
            // Email va parol bilan foydalanuvchini izlash
            Users foundUser = null;
            try {
                foundUser = entityManager.createQuery("from Users where email = :email", Users.class)
                        .setParameter("email", email)
                        .getSingleResult();
            } catch (Exception e) {
                resp.sendRedirect("/login.jsp?error=invalid-credentials");
                return;
            }

            // Parolni tekshirish (hashingni qo'llash kerak)
            if (foundUser != null && foundUser.getPassword().equals(password)) {  // Bu yerda parolni tekshirish xavfsiz usulda bo'lishi kerak
                req.getSession().setAttribute("currentUser", foundUser);
                resp.sendRedirect("/event.jsp");
            } else {
                resp.sendRedirect("/login.jsp?error=invalid-credentials");
            }
        }
    }
}
