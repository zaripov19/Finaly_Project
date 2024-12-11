package uz.pdp.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import uz.pdp.entity.Roles;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;

@WebListener
public class MyListener implements ServletContextListener {
    public static EntityManagerFactory EMF;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        EMF = Persistence.createEntityManagerFactory("finaly");

        try (EntityManager entityManager = EMF.createEntityManager()) {
            List<Roles> roles = entityManager.createQuery("from Roles", Roles.class).getResultList();
            if (roles.isEmpty()) {
                entityManager.getTransaction().begin();
                Roles adminRole = new Roles("ADMIN");
                Roles userRole = new Roles("USER");
                entityManager.persist(adminRole);
                entityManager.persist(userRole);
                entityManager.getTransaction().commit();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
