package spring_repos;

import models.Revenue;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SprRevenueRepository extends PagingAndSortingRepository<Revenue,Long> {
    Iterable<Revenue> findAll(Sort sort);


}
