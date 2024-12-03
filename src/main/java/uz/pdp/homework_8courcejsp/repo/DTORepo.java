package uz.pdp.homework_8courcejsp.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.homework_8courcejsp.entity.req.PaymentDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static uz.pdp.homework_8courcejsp.config.MyListener.emf;

public class DTORepo {
    public static Optional<List<PaymentDTO>> findAll() {
        try (EntityManager entityManager = emf.createEntityManager()) {
            List<PaymentDTO> results = entityManager
                    .createNativeQuery("""
                                select c.name, count(distinct s.id), coalesce(sum(amount), 0)
                                from payment p
                                right join public.student s on s.id = p.student_id
                                join public.groups g on g.id = s.group_id
                                join public.module m on m.id = g.module_id
                                right join public.course c on c.id = m.course_id
                                group by c.id
                            """, PaymentDTO.class)
                    .getResultList();
            return Optional.of(results);
        }
    }
}
