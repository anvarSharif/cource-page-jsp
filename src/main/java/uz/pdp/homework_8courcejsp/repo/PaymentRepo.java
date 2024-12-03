package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.config.MyListener;
import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.entity.Payment;

import java.util.Objects;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class PaymentRepo {
    public static void save(Payment payment) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            entityManager.getTransaction().begin();
            entityManager.persist(payment);
            entityManager.getTransaction().commit();
        }
    }

    public static Optional<Payment> findById(Integer paymentId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            Payment payment = entityManager.find(Payment.class, paymentId);
            return Optional.of(payment);
        }
    }

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
