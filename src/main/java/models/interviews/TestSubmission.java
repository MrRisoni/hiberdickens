package models.interviews;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.Date;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "test_submissions")
public class TestSubmission {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Getter
    @Setter
    @Column
    private String session_id;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date time_window_starts;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date time_window_ends;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date started_at;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date ended_at;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date deadline_at;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "test_id")
    private TestModel testObj;

    public TestSubmission() {
    }

    public TestModel getTestObj() {
        return testObj;
    }

    public void setTestObj(TestModel testObj) {
        this.testObj = testObj;
    }
}
