package models;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "interview_stages")
public class InterViewStage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;

    @Column
    private int active;

    @Column
    private int shown_order;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinColumn(name = "stage_id")
    private List<InterViewGrade> gradesList = new ArrayList<InterViewGrade>();

    public InterViewStage() {
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

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getShown_order() {
        return shown_order;
    }

    public void setShown_order(int shown_order) {
        this.shown_order = shown_order;
    }

    public List<InterViewGrade> getGradesList() {
        return gradesList;
    }

    public void setGradesList(List<InterViewGrade> gradesList) {
        this.gradesList = gradesList;
    }
}
