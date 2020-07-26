package models;


import javax.persistence.*;

@Entity
@Table(name = "job_opening_courses")
public class JobOpeningCourse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "course_id")
    private CourseModel courseObj;


    public JobOpeningCourse() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CourseModel getCourseObj() {
        return courseObj;
    }

    public void setCourseObj(CourseModel courseObj) {
        this.courseObj = courseObj;
    }
}
