package spring_repos;

import models.school.SchoolClass;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprSchoolClassRepository extends CrudRepository<SchoolClass,Long> {
}
