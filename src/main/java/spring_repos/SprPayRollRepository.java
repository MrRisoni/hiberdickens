package spring_repos;

import models.PayRoll;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprPayRollRepository extends CrudRepository<PayRoll,Long> {}
