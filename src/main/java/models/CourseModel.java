package models;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Entity
@Table(name = "courses")
public class CourseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @NotNull
    @Column
    private String title;

    @Column
    private int active;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "course_type_id")
    private CourseType courseTypeObj;

    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private int numStudents;

    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private int numTeachers;

    @Formula("(SELECT COUNT(t.id) FROM teaches t WHERE t.course_id = id)")
    private int numGroups;

    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private int sumPayments;

    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private int sumHours;

    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private BigDecimal latestFee;

    @Formula("(SELECT IF(w.amount IS NULL,0,w.amount) FROM course_wages w WHERE w.course_id = id ORDER BY w.updated_at LIMIT 1)")
    private BigDecimal latestWage;

    public CourseModel() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public CourseType getCourseTypeObj() {
        return courseTypeObj;
    }

    public void setCourseTypeObj(CourseType courseTypeObj) {
        this.courseTypeObj = courseTypeObj;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getNumStudents() {
        return numStudents;
    }


   public int getNumTeachers() {
        return numTeachers;
    }



    public int getNumGroups() {
        return numGroups;
    }

    public int getSumPayments() {
        return sumPayments;
    }


    public int getSumHours() {
        return sumHours;
    }


    public BigDecimal getLatestFee() {
        return latestFee;
    }


    public BigDecimal getLateastWage() {
        return latestWage;
    }


}
