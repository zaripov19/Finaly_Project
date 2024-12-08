package uz.pdp.entity;

import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.entity.abs.BaseEntity;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Event extends BaseEntity {

    private String title;
    private String description;
    private String speaker;
    private Integer pay;
    private Integer count;
    private LocalDateTime startTime;
    private LocalDateTime endTime;


}
