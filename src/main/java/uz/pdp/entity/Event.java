package uz.pdp.entity;

import jakarta.persistence.Column;
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

    @Column(nullable = false, length = 100)
    private String title; // Event nomi

    @Column(nullable = false, length = 500)
    private String description; // Event tavsifi

    @Column(nullable = false, length = 100)
    private String speaker; // Spikerning ismi

    @Column(nullable = true, length = 255)
    private String photoUrl; // Rasm URL manzili

    @Column(nullable = false)
    private Integer pay; // To'lov miqdori

    @Column(nullable = false)
    private Integer count; // O'rindiqlar soni

    @Column(nullable = false)
    private LocalDateTime startTime; // Boshlanish vaqti

    @Column(nullable = false)
    private LocalDateTime endTime; // Tugash vaqti

    public Event(String title, String description, String speaker, Integer pay, Integer count, LocalDateTime startTime, LocalDateTime endTime, String photoUrl) {
        this.title = title;
        this.description = description;
        this.speaker = speaker;
        this.pay = pay;
        this.count = count;
        this.startTime = startTime;
        this.endTime = endTime;
        this.photoUrl = photoUrl;
    }
}
