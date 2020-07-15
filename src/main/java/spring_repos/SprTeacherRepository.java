package spring_repos;

import models.Teacher;
import org.springframework.data.repository.CrudRepository;

public interface SprTeacherRepository extends CrudRepository<Teacher,Long> {
}
