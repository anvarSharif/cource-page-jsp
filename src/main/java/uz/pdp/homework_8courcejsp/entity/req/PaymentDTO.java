package uz.pdp.homework_8courcejsp.entity.req;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentDTO {
    private String name;
    private Long count;
    private Long amount;


    public PaymentDTO(String name, Long count, Long amount) {
        this.name = name;
        this.count = count;
        this.amount = amount;
    }


}

