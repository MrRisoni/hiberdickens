package models.interviews;

import lombok.Getter;
import lombok.Setter;
import models.groups.CourseModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "job_opening_courses")
public class JobOpeningCourse {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "course_id")
    private CourseModel courseObj;

    public JobOpeningCourse() {
    }

    public CourseModel getCourseObj() {
        return courseObj;
    }

    public void setCourseObj(CourseModel courseObj) {
        this.courseObj = courseObj;
    }
}
