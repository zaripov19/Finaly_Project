package uz.pdp.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.entity.abs.BaseEntity;

import java.util.List;

import static uz.pdp.config.MyListener.EMF;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Users extends BaseEntity {

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    @Email
    @Column(unique = true, nullable = false)
    private String email;

    @Size(min = 8, max = 16)
    @Column(nullable = false)
    private String password;


    public boolean hasRole(String role) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            List<String> roleNames = entityManager.createNativeQuery("""
                            SELECT r.name
                            FROM users u
                            JOIN userrole ur ON ur.users_id = u.id
                            JOIN roles r ON r.id = ur.roles_id
                            WHERE u.id = :id
                            """, String.class)
                    .setParameter("id", getId())
                    .getResultList();
            return roleNames.contains(role);
        } catch (Exception e) {
            // Xatolikni to'g'ri boshqarish va aniq xabar berish.
            throw new RuntimeException("Error checking role for user with ID: " + getId(), e);
        }
    }
}
