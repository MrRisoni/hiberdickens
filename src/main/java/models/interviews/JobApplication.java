package models.interviews;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "job_applications")
public class JobApplication {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Getter
    @Setter
    @Column
    private String full_name;

    @Getter
    @Setter
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date dob;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "opening_id")
    private JobOpening jobOpenObj;

    public JobApplication() {
    }

    public JobOpening getJobOpenObj() {
        return jobOpenObj;
    }

    public void setJobOpenObj(JobOpening jobOpenObj) {
        this.jobOpenObj = jobOpenObj;
    }
}
