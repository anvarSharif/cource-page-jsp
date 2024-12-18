package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.config.MyListener;
import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.entity.Payment;

import java.util.Objects;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class PaymentRepo extends BaseRepo<Payment>{




    public static Integer sumAmountForStudent(Integer studentId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            return (Integer) Objects.requireNonNullElse(
                    entityManager.createNativeQuery(
                                    "select sum(amount) from payment where student_id=:studentId",
                                    Integer.class)
                            .setParameter("studentId", studentId)
                            .getSingleResult(), 0);
        }
    }
}
