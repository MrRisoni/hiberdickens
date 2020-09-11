package spring_repos;

import models.groups.CourseModel;
import org.springframework.data.repository.CrudRepository;

public interface SprCourseRepository extends CrudRepository<CourseModel,Long> {
}
