package models;
import javax.persistence.*;

@Entity
@Table(name = "diplomas")
public class Diploma {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private int active;


    @OneToOne
    @JoinColumn(name = "course_id")
    private CourseModel cours;

    public Diploma() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
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
}
