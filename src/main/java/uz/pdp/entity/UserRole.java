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
    private Roles roles;
    @ManyToOne
    private Users users;


}