package models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "interview_schedule")
public class InterViewSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @NotNull
    @Column
    private String notes;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date starts_at;

    @Column
    private int active;


    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "application_id")
    private JobApplication applicationObj;


    public InterViewSchedule() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Date getStarts_at() {
        return starts_at;
    }

    public void setStarts_at(Date starts_at) {
        this.starts_at = starts_at;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public JobApplication getApplicationObj() {
        return applicationObj;
    }

    public void setApplicationObj(JobApplication applicationObj) {
        this.applicationObj = applicationObj;
    }
}
