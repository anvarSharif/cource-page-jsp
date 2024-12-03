package uz.pdp.homework_8courcejsp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import uz.pdp.homework_8courcejsp.entity.enums.PayType;

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
    @Column(name = "paytype")
    @Enumerated(EnumType.STRING)
    private PayType payType;
    @CreationTimestamp
    @Column(nullable = false,updatable = false)
    private LocalDateTime dateTime;
    @ManyToOne
    private Student student;

    public Payment(Integer amount, PayType payType, Student student) {
        this.amount = amount;
        this.payType = payType;
        this.student = student;
    }
}
