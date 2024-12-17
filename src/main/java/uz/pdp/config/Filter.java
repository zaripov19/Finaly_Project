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
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class Filter extends HttpFilter {

    private final List<String> openPaths = new ArrayList<>(List.of(
            "/login.jsp",
            "/auth/login",
            "/register.jsp",
            "/auth/register"
    ));

    private final List<String> adminPaths = new ArrayList<>(List.of(
            "/Adminevent.jsp",
            "/Addevent.jsp",
            "/Report.jsp",
            "/report",
            "/admin/delete",
            "/add"
    ));

    private final List<String> userPaths = new ArrayList<>(List.of(
            "/event.jsp",
            "/participate"
    ));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        String path = req.getServletPath(); // getRequestURI o'rniga getServletPath
        HttpSession session = req.getSession(false);


        if (openPaths.contains(path)) {
            chain.doFilter(req, res);
            return;
        }


        if (session == null || session.getAttribute("currentUser") == null) {
            res.sendRedirect("/login.jsp");
            return;
        }


        Users currentUser = (Users) session.getAttribute("currentUser");


        if (adminPaths.contains(path) && currentUser.hasRole("ADMIN")) {
            chain.doFilter(req, res);
            return;
        }


        if (userPaths.contains(path) && currentUser.hasRole("USER")) {
            chain.doFilter(req, res);
            return;
        }

        res.sendRedirect("/login.jsp");
    }
}
