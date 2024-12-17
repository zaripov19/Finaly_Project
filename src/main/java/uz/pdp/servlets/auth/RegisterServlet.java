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

        if (password.equals(passwordRepeat)) {
            Users user = new Users(firstName,
                    lastName,
                    email,
                    password);
            try (EntityManager entityManager = EMF.createEntityManager()) {
                Map<String, String> map = new HashMap<>();
                Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
                Set<ConstraintViolation<Users>> validate = validator.validate(user);
                for (ConstraintViolation<Users> validation : validate) {
                    map.put(validation.getPropertyPath().toString(), validation.getMessage());
                }
                if (!map.isEmpty()) {
                    req.setAttribute("errors", map);
                    req.getRequestDispatcher("/register.jsp").forward(req, resp);
                    return;
                }
                entityManager.getTransaction().begin();
                entityManager.persist(user);
                entityManager.getTransaction().commit();
                resp.sendRedirect("/login.jsp");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            resp.sendRedirect("register.jsp");
        }
    }
}