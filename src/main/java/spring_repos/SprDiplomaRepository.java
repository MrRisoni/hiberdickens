package spring_repos;


import models.languages.Diploma;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprDiplomaRepository extends CrudRepository<Diploma,Long> {
}
