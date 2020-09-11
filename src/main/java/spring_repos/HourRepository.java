package spring_repos;


import models.groups.HourModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HourRepository extends CrudRepository<HourModel,Long> {
}
