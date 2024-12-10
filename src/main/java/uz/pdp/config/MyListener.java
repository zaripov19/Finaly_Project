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
            List<Roles> fromRoles = entityManager.createQuery("from Roles", Roles.class).getResultList();
            if (fromRoles.isEmpty()) {
                entityManager.getTransaction().begin();
                Roles roles1 = new Roles("ADMIN");
                Roles roles2 = new Roles("USER");
                entityManager.persist(roles1);
                entityManager.persist(roles2);
                entityManager.getTransaction().commit();
            }
        } catch (Exception e) {
            throw new RuntimeException("Error initializing roles", e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (EMF != null && EMF.isOpen()) {
            EMF.close();
        }
    }
}
