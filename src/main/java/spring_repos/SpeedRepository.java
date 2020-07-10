package spring_repos;

import models.Speed;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpeedRepository  extends CrudRepository<Speed,Long> {
}

