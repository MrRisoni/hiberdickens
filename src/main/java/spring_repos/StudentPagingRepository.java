package spring_repos;

import models.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface StudentPagingRepository extends PagingAndSortingRepository<Student,Long> {
    Page<Student> findAll(Pageable pg);

}
