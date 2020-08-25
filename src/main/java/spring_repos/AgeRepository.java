package spring_repos;

import models.groups.Age;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AgeRepository  extends CrudRepository<Age,Long> {
}
