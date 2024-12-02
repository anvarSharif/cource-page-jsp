package uz.pdp.homework_8courcejsp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer amount;
    private String payType;
    @CreationTimestamp
    @Column(nullable = false,updatable = false)
    private LocalDateTime dateTime;
    @ManyToOne
    private Student student;
}
