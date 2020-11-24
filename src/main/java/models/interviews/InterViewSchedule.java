package models.interviews;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.Date;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "interview_schedule")
public class InterViewSchedule {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Getter
    @Setter
    @Column
    private String notes;

    @Getter
    @Setter
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date starts_at;

    @Getter
    @Setter
    @Column
    private int active;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "application_id")
    private JobApplication applicationObj;

    public InterViewSchedule() {
    }

    public JobApplication getApplicationObj() {
        return applicationObj;
    }

    public void setApplicationObj(JobApplication applicationObj) {
        this.applicationObj = applicationObj;
    }
}
