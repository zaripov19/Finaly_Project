package uz.pdp.servlets.auth;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
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
        try (EntityManager entityManager = EMF.createEntityManager()) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            Users foundUser = entityManager.createQuery("from Users where email = :email and password = :password", Users.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();

            if (foundUser == null) {
                resp.sendRedirect("/login.jsp");
            } else {
                req.getSession().setAttribute("currentUser", foundUser);
                if (foundUser.hasRole("ADMIN")) {

                    resp.sendRedirect("Adminevent.jsp");

                } else if (foundUser.hasRole("USER")) {
                    resp.sendRedirect("/event.jsp");
                } else {
                    resp.sendRedirect("/login.jsp");
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
