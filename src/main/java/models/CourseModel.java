package models;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

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
}
