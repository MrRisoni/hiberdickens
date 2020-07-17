package models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "job_applications")
public class JobApplication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @NotNull
    @Column
    private String full_name;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date dob;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "opening_id")
    private JobOpening jobOpenObj;

    public JobApplication() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public JobOpening getJobOpenObj() {
        return jobOpenObj;
    }

    public void setJobOpenObj(JobOpening jobOpenObj) {
        this.jobOpenObj = jobOpenObj;
    }
}
