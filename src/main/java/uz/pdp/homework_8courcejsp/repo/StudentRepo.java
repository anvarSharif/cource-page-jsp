package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Groups;
import uz.pdp.homework_8courcejsp.entity.Student;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class StudentRepo {
    public static Optional<List<Student>> findByGroupId(Integer groupId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            List<Student> studentList = entityManager.createNativeQuery(
                            "select * from student where group_id=:groupId", Student.class)
                    .setParameter("groupId", groupId)
                    .getResultList();
            return Optional.of(studentList);
        }
    }

    public static Optional<Student> findById(Integer studentId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            Student student = entityManager.find(Student.class, studentId);
            return Optional.of(student);
        }
    }
}
