package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.entity.Module;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class ModuleRepo {
    public static Optional<List<Module>> findByCourseId(Integer courseId){
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            List<Module> moduleList = entityManager.createNativeQuery(
                    "select * from module where course_id=:courseId", Module.class)
                    .setParameter("courseId",courseId)
                    .getResultList();
            return Optional.of(moduleList);
        }
    }
}
