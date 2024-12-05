package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Student;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class StudentRepo extends BaseRepo<Student> {
    public static Optional<List<Student>> findByGroupId(Integer groupId, String search, Integer pageNumber) {
        pageNumber--;
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            List<Student> studentList = entityManager.createNativeQuery(
                            "select * from student where group_id=:groupId and name ilike '%'||:searchjon||'%' limit 3 offset :off", Student.class)
                    .setParameter("groupId", groupId)
                    .setParameter("off", pageNumber * 3)
                    .setParameter("searchjon",search)
                    .getResultList();
            return Optional.of(studentList);
        }
    }

    public static Long count(String search, Integer groupId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            return (Long) entityManager.createNativeQuery(
                            "select count(*) from student where group_id=:groupIdjon and name ilike '%'||:searchjon||'%'", Long.class)
                    .setParameter("searchjon",search)
                    .setParameter("groupIdjon",groupId)
                    .getSingleResult();
        }
    }
}
