package uz.pdp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.entity.abs.BaseEntity;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity()
public class Roles extends BaseEntity {
    private String name;
}