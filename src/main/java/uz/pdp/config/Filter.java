package uz.pdp.config;

import uz.pdp.entity.Users;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebFilter("/*")
public class Filter extends HttpFilter {

    private final Set<String> openPaths = new HashSet<>(Set.of("/login.jsp", "/auth/login", "/register.jsp", "/auth/register"));
    private final Set<String> adminPaths = new HashSet<>(Set.of("/Adminevent.jsp", "/Addevent.jsp", "/Report.jsp"));
    private final Set<String> userPaths = new HashSet<>(Set.of("/event.jsp"));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (openPaths.contains(req.getRequestURI())) {
            chain.doFilter(req, res);
            return;
        }

        HttpSession session = req.getSession();
        Object object = session.getAttribute("currentUser");

        if (object == null) {
            res.sendRedirect("/login.jsp");
        } else {
            Users currentUser = (Users) object;

            // Check if the user has the appropriate role to access the path
            if (adminPaths.contains(req.getRequestURI()) && currentUser.hasRole("ADMIN")) {
                chain.doFilter(req, res);
            } else if (userPaths.contains(req.getRequestURI()) && currentUser.hasRole("USER")) {
                chain.doFilter(req, res);
            } else {
                res.sendRedirect("/login.jsp");
            }
        }
    }
}