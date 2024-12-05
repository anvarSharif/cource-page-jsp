package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Groups;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class GroupRepo extends BaseRepo<Groups> {
    public static Optional<List<Groups>> findByModuleId(Integer moduleId, String search, Integer pageNumber){
        pageNumber--;
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            List<Groups> groupsList = entityManager.createNativeQuery(
                            "select * from groups where module_id=:moduleId and name ilike '%'||:searchjon||'%' limit 3 offset :off", Groups.class)
                    .setParameter("moduleId",moduleId)
                    .setParameter("off", pageNumber * 3)
                    .setParameter("searchjon",search)
                    .getResultList();
            return Optional.of(groupsList);
        }
    }
    public static Long count(String search, Integer moduleId) {
        try (
                EntityManager entityManager = emf.createEntityManager()
        ) {
            return (Long) entityManager.createNativeQuery(
                            "select count(*) from groups where module_id=:moduleIdjon and name ilike '%'||:searchjon||'%'", Long.class)
                    .setParameter("moduleIdjon",moduleId)
                    .setParameter("searchjon",search)
                    .getSingleResult();
        }
    }
}
