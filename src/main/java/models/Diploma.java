package models;
import javax.persistence.*;

@Entity
@Table(name = "diplomas")
public class Diploma {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private int active;

    @Column
    private String level;

    @OneToOne
    @JoinColumn(name = "course_id")
    private CourseModel cours;

    public Diploma() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }


    public CourseModel getCours() {
        return cours;
    }

    public void setCours(CourseModel cours) {
        this.cours = cours;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
