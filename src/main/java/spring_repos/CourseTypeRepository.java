package spring_repos;

import models.groups.CourseType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseTypeRepository  extends CrudRepository<CourseType,Long> {
}

