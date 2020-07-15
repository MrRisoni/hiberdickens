package spring_repos;

import models.GroupModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprGroupRepository extends CrudRepository<GroupModel,Long>{}
