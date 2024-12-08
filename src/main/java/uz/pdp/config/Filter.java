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

@WebFilter()
public class Filter extends HttpFilter {

    private List<String> openPaths = new ArrayList<>(
            List.of(
                    "/login.jsp",
                    "/auth/login",
                    "/register.jsp",
                    "/auth/register"
            )
    );

    private List<String> adminPaths = new ArrayList<>(
            List.of(
                    "/Adminevent.jsp",
                    "/Addevent.jsp",
                    "/Report.jsp"
            )
    );
    private List<String> userPaths = new ArrayList<>(
            List.of(
                    "/event.jsp"
            )
    );

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (openPaths.contains(req.getRequestURI())) {
            chain.doFilter(req, res);
            return;
        }

        // Sessiyani olish (sessiya yaratmasdan)
        HttpSession session = req.getSession();
        Object object = session.getAttribute("cuurentUser");
        if (object == null) {
            res.sendRedirect("/login.jsp");
            return;
        } else {
            Users currentUser = (Users) object;
            // Avtorizatsiya tekshirish
            if (adminPaths.contains(req.getRequestURI()) && currentUser.hasRole("ADMIN")) {
                chain.doFilter(req, res);
            } else if (userPaths.contains(req.getRequestURI()) && currentUser.hasRole("USER")) {
                chain.doFilter(req, res);
            } else {
                res.sendRedirect("/login.jsp");
                return;
            }
        }
        chain.doFilter(req, res);
    }
}