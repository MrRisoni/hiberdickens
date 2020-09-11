package spring_repos;

import models.school.Discipline;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DisciplineRepository  extends CrudRepository<Discipline,Long> {
}
