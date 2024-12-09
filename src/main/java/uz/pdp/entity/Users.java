package uz.pdp.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import uz.pdp.entity.abs.BaseEntity;

import java.util.List;

import static uz.pdp.config.MyListener.EMF;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Users extends BaseEntity {

    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @Column(unique = true, nullable = false)
    @Email
    private String email;
    @Column(unique = true, nullable = false)
    @Size(min = 8, max = 16)
    private String password;


    public boolean hasRole(String role) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            List<String> roleNames = (List<String>) entityManager.createNativeQuery("""
                            select r.name
                            from users u
                                     join userrole ur on ur.users_id = u.id
                                     join roles r on r.id = ur.roles_id
                            where u.id = :id
                            """, String.class)
                    .setParameter("id", getId())
                    .getResultList();
            return roleNames.contains(role);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}