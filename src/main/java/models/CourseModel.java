package models;
import javax.persistence.*;

@Entity
@Table(name = "courses")
public class CourseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_type_id")
    private CourseType courseTypeObj;

    public CourseModel() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
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
}
