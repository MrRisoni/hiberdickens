package models.groups;


import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "course_grades")
public class CourseGrade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @NotNull
    @Column(name="grade_title")
    private String title;

    public CourseGrade() {
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
}
