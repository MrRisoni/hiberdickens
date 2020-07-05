package models;

import com.fasterxml.jackson.annotation.JsonInclude;

import javax.persistence.*;

@Entity
@Table(name = "interviews_grading")
public class InterViewGrade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column(nullable = true)
    private float grade;

    @Column(nullable = true)
    private int passed;

    @Column
    private String notes;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "application_id")
    private JobApplication applicationObj;

    public InterViewGrade() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public int getPassed() {
        return passed;
    }

    public void setPassed(int passed) {
        this.passed = passed;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public JobApplication getApplicationObj() {
        return applicationObj;
    }

    public void setApplicationObj(JobApplication applicationObj) {
        this.applicationObj = applicationObj;
    }
}
