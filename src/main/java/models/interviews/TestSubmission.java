package models.interviews;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "test_submissions")
public class TestSubmission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String session_id;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date time_window_starts;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date time_window_ends;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date started_at;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date ended_at;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date deadline_at;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "test_id")
    private TestModel testObj;

    public TestSubmission() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTime_window_starts() {
        return time_window_starts;
    }

    public void setTime_window_starts(Date time_window_starts) {
        this.time_window_starts = time_window_starts;
    }

    public Date getTime_window_ends() {
        return time_window_ends;
    }

    public void setTime_window_ends(Date time_window_ends) {
        this.time_window_ends = time_window_ends;
    }

    public Date getStarted_at() {
        return started_at;
    }

    public void setStarted_at(Date started_at) {
        this.started_at = started_at;
    }


    public Date getDeadline_at() {
        return deadline_at;
    }

    public void setDeadline_at(Date deadline_at) {
        this.deadline_at = deadline_at;
    }

    public TestModel getTestObj() {
        return testObj;
    }

    public void setTestObj(TestModel testObj) {
        this.testObj = testObj;
    }

    public Date getEnded_at() {
        return ended_at;
    }

    public void setEnded_at(Date ended_at) {
        this.ended_at = ended_at;
    }

    public String getSession_id() {
        return session_id;
    }

    public void setSession_id(String session_id) {
        this.session_id = session_id;
    }
}

