package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Course;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class CourseRepo {
    public static Optional<List<Course>> FindAll(Integer pageNumber, String search) {
        pageNumber--;
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            entityManager.getTransaction().begin();
            List<Course> courses = entityManager.createNativeQuery(
                    "select * from course where name ilike '%'||:searchjon||'%' limit 3 offset :off", Course.class)
                    .setParameter("off", pageNumber * 3)
                    .setParameter("searchjon",search)
                    .getResultList();
            entityManager.getTransaction().commit();
            return Optional.of(courses);
        }
    }

    public static Optional<Course> findById(Integer courseId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            entityManager.getTransaction().begin();
            Course course = entityManager.find(Course.class, courseId);
            entityManager.getTransaction().commit();
            return Optional.of(course);
        }
    }


    public static Long count(String search) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            return (Long) entityManager.createNativeQuery(
                    "select count(*) from course where name ilike '%'||:searchjon||'%'", Long.class)
                    .setParameter("searchjon",search)
                    .getSingleResult();
        }
    }
}












