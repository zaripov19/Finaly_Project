package uz.pdp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.entity.Event;

import java.util.Collections;
import java.util.List;

import static uz.pdp.config.MyListener.EMF;

public class EventRepo {
    public static List<Event> getEvents() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("from Event ", Event.class)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Xatolik haqida ma'lumotni konsolga chiqarish
            return Collections.emptyList(); // Bo'sh ro'yxatni qaytarish
        }
    }
}
