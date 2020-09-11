package spring_repos;

import models.seminars.Seminars;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprSeminarRepository extends CrudRepository<Seminars,Long> {
}
