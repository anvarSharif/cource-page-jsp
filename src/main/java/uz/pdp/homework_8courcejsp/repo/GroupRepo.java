package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.Groups;
import uz.pdp.homework_8courcejsp.entity.Module;

import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class GroupRepo {
    public static Optional<List<Groups>> findByModuleId(Integer moduleId){
        try (
                EntityManager entityManager = emf.createEntityManager()
        ){
            List<Groups> groupsList = entityManager.createNativeQuery(
                            "select * from groups where module_id=:moduleId", Groups.class)
                    .setParameter("moduleId",moduleId)
                    .getResultList();
            return Optional.of(groupsList);
        }
    }
}
