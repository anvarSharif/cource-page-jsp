package uz.pdp.homework_8courcejsp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Module extends BaseEntity{

    private String name;
    @ManyToOne
    private Course course;
}
