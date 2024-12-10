package uz.pdp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.entity.abs.BaseEntity;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class UserRole extends BaseEntity {

    @ManyToOne
    private Roles roles;  // "roles" deb emas, "role" deb nomlash yaxshiroq.

    @ManyToOne
    private Users users;  // "users" deb emas, "user" deb nomlash yaxshiroq.
}
