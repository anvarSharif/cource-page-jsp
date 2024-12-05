package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Module;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class ModuleRepo {
    public static Optional<List<Module>> findByCourseId(Integer courseId, String search, Integer pageNumber){
        pageNumber--;
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            List<Module> moduleList = entityManager.createNativeQuery(

                    "select * from module where course_id=:courseId and name ilike '%'||:searchjon||'%' limit 3 offset :off", Module.class)
                    .setParameter("courseId",courseId)
                    .setParameter("off", pageNumber * 3)
                    .setParameter("searchjon",search)
                    .getResultList();
            return Optional.of(moduleList);
        }
    }
    public static Long count(String search, Integer courseId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            return (Long) entityManager.createNativeQuery(
                            "select count(*) from module where course_id=:courseIdjon and name ilike '%'||:searchjon||'%'", Long.class)
                    .setParameter("searchjon",search)
                    .setParameter("courseIdjon",courseId)
                    .getSingleResult();
        }
    }
}
