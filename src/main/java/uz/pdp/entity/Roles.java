package uz.pdp.entity;

import jakarta.persistence.Entity;
import lombok.*;
import uz.pdp.entity.abs.BaseEntity;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Roles extends BaseEntity {
    private String name;
}
