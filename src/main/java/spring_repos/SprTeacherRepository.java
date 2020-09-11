package spring_repos;

import models.people.Teacher;
import org.springframework.data.repository.CrudRepository;

public interface SprTeacherRepository extends CrudRepository<Teacher,Long> {
}
