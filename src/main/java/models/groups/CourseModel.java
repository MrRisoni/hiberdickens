package models.groups;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.*;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "courses")
public class CourseModel {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private String title;

    @Getter
    @Setter
    @Column
    private int active;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "course_type_id")
    private CourseType courseTypeObj;

    @Getter
    @Setter
    @Formula("(SELECT COUNT(gs.id) FROM groupakia g JOIN group_students gs ON gs.group_id = g.id WHERE g.course_id = id)")
    private int numStudents;

    @Getter
    @Setter
    @Formula("(SELECT COUNT(t.id) FROM teaches t WHERE t.course_id = id)")
    private int numTeachers;

    @Getter
    @Setter
    @Formula("(SELECT COUNT(g.id) AS numGroups FROM groupakia g WHERE g.course_id = id)")
    private int numGroups;

    @Getter
    @Setter
    @Formula("( SELECT CASE WHEN SUM(stp.amount) IS NULL THEN 0 ELSE SUM(stp.amount) END  FROM student_payed stp JOIN groupakia g ON g.id = stp.group_id WHERE g.course_id =id)")
    private BigDecimal sumPayments;

    @Getter
    @Setter
    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private int sumHours;

    @Getter
    @Setter
    @Formula("(SELECT TOP 1 CASE WHEN f.fee IS NULL THEN 0 ELSE f.fee END FROM course_fees f WHERE f.course_id = id ORDER BY f.updated_at)")
    private BigDecimal latestFee;

    @Getter
    @Setter
    @Formula("(SELECT TOP 1 CASE WHEN w.wage IS NULL THEN 0  ELSE w.wage END FROM course_wages w WHERE w.course_id = id ORDER BY w.updated_at)")
    private BigDecimal latestWage;

    public CourseModel() {
    }

    public CourseType getCourseTypeObj() {
        return courseTypeObj;
    }

    public void setCourseTypeObj(CourseType courseTypeObj) {
        this.courseTypeObj = courseTypeObj;
    }
}