package models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "mock_exams")
public class MockExam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="group_id", nullable=false)
    @JsonIgnoreProperties("mockExams")
    private GroupModel groupObj;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="exam_id")
    private List<MockExamResult> exam_results = new ArrayList<MockExamResult>();

    @OneToOne
    @JoinColumn(name = "period_id")
    private Period period;


    @OneToOne
    @JoinColumn(name = "grad_sys_id")
    private GradingSystem gradSys;

    @Column
    private java.sql.Date exam_year;

    public MockExam() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public List<MockExamResult> getExam_results() {
        return exam_results;
    }

    public void setExam_results(List<MockExamResult> exam_results) {
        this.exam_results = exam_results;
    }

    public Period getPeriod() {
        return period;
    }

    public void setPeriod(Period period) {
        this.period = period;
    }

    public GradingSystem getGradSys() {
        return gradSys;
    }

    public void setGradSys(GradingSystem gradSys) {
        this.gradSys = gradSys;
    }

    public Date getExam_year() {
        return exam_year;
    }

    public void setExam_year(Date exam_year) {
        this.exam_year = exam_year;
    }
}
