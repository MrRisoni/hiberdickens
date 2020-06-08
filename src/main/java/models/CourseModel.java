package models;
import javax.persistence.*;

@Entity
@Table(name = "zones")
public class CourseModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @Column
    private String title;

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
}
