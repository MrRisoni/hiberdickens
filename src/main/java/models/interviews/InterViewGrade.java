package models.interviews;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.Date;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "interviews_grading")
public class InterViewGrade {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Getter
    @Setter
    @Column(nullable = true)
    private float grade;

    @Getter
    @Setter
    @Column(nullable = true)
    private int passed;

    @Getter
    @Setter
    @Column
    private String notes;

    @Getter
    @Setter
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date evaluated_at;

    @Getter
    @Setter
    @Column(nullable = true)
    private int evaluated;


    @OneToOne(fetch = FetchType.LAZY, optional = false)// was eager
    @JoinColumn(name = "application_id")
    private JobApplication applicationObj;

    public InterViewGrade() {
    }

    public JobApplication getApplicationObj() {
        return applicationObj;
    }

    public void setApplicationObj(JobApplication applicationObj) {
        this.applicationObj = applicationObj;
    }
}
