package spring_repos;

import models.ParentsModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParentRepository extends CrudRepository<ParentsModel,Long> {
}
