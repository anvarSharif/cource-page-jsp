package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.config.MyListener;
import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.entity.Payment;

import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class PaymentRepo {
    public static void save(Payment payment){
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            entityManager.getTransaction().begin();
            entityManager.persist(payment);
            entityManager.getTransaction().commit();
        }
    }
    public static Optional<Payment> findById(Integer paymentId){
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            entityManager.getTransaction().begin();
            Payment payment = entityManager.find(Payment.class, paymentId);
            entityManager.getTransaction().commit();
            return Optional.of(payment);
        }
    }
}
