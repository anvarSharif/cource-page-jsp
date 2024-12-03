package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.entity.Payment;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class CourseRepo {
    public static Optional<List<Course>> FindAll(){
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            entityManager.getTransaction().begin();
            List<Course> courses = entityManager.createQuery("from Course", Course.class).getResultList();
            entityManager.getTransaction().commit();
            return Optional.of(courses);
        }
    }
    public static Optional<Course> findById(Integer courseId){
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            entityManager.getTransaction().begin();
            Course course = entityManager.find(Course.class, courseId);
            entityManager.getTransaction().commit();
            return Optional.of(course);
        }
    }


}
