package models.groups;

import com.fasterxml.jackson.annotation.JsonView;
import models.JackSonViewer;
import org.hibernate.annotations.*;

import javax.persistence.*;
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
    @JsonView(JackSonViewer.ICourse.class)
    private Long id;

    @NotNull
    @Column
    @JsonView(JackSonViewer.ICourse.class)
    private String title;

    @Column
    @JsonView(JackSonViewer.ICourse.class)
    private int active;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "course_type_id")
    @JsonView(JackSonViewer.ICourse.class)
    private CourseType courseTypeObj;

    @JsonView(JackSonViewer.ICourse.class)
    @Formula("(SELECT COUNT(gs.id) FROM groupakia g JOIN group_students gs ON gs.group_id = g.id WHERE g.course_id = id)")
    private int numStudents;

    @JsonView(JackSonViewer.ICourse.class)
    @Formula("(SELECT COUNT(t.id) FROM teaches t WHERE t.course_id = id)")
    private int numTeachers;

    @JsonView(JackSonViewer.ICourse.class)
    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private int numGroups;

    @JsonView(JackSonViewer.ICourse.class)
    @Formula("(SELECT IF(SUM(stp.amount) IS NULL,0,SUM(stp.amount)) FROM student_payed stp JOIN groupakia g ON g.id = stp.group_id WHERE g.course_id = id)")
    private BigDecimal sumPayments;

    @JsonView(JackSonViewer.ICourse.class)
    @Formula("(SELECT COUNT(g.id) FROM groupakia g WHERE g.course_id = id)")
    private int sumHours;

    @JsonView(JackSonViewer.ICourse.class)
    @Formula("(SELECT IF(f.amount IS NULL,0,f.amount) FROM course_fees f WHERE f.course_id = id ORDER BY f.updated_at LIMIT 1)")
    private BigDecimal latestFee;

    @JsonView(JackSonViewer.ICourse.class)
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

    public BigDecimal getSumPayments() {
        return sumPayments;
    }

    public int getSumHours() {
        return sumHours;
    }

    public BigDecimal getLatestFee() {
        return latestFee;
    }


    public BigDecimal getLatestWage() {
        return latestWage;
    }
}
