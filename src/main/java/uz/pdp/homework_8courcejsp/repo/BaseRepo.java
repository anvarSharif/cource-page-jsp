package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class BaseRepo<T> {
    public void save(T entity){
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
        }
    }
}
