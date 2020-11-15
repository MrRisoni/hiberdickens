package models.interviews;

import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

import java.util.Date;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
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

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date evaluated_at;

    @Column(nullable = true)
    private int evaluated;


    @OneToOne(fetch = FetchType.LAZY,optional = false)// was eager
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

    public Date getEvaluated_at() {
        return evaluated_at;
    }

    public void setEvaluated_at(Date evaluated_at) {
        this.evaluated_at = evaluated_at;
    }

    public int getEvaluated() {
        return evaluated;
    }

    public void setEvaluated(int evaluated) {
        this.evaluated = evaluated;
    }
}
