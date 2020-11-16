package models.seminars;

import lombok.Data;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Formula;
import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "seminar_modules")
public class SeminarModules {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private String title;

    @Column
    private int active;

    @Column
    private int part_time;

    @Column
    private int on_site;

    @Column
    private float cost;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date starts;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date ends;

    @Column
    private int max_seats;

    @Column
    private int total_hours;

    @Column
    private float cost_per_hour;

    @Formula("(SELECT COUNT(semt.teacher_id) FROM seminar_teachers semt WHERE semt.module_id = id)")
    private int numTeachers;

    @Formula("(SELECT COUNT(semg.group_id) FROM seminar_groups semg WHERE semg.module_id = id)")
    private int numGroups;


    public SeminarModules() {
    }
}