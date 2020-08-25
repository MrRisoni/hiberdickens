package models.exams;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import models.general.Period;
import models.groups.GradingSystem;
import models.groups.GroupModel;

import javax.persistence.*;
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

    @OneToMany( mappedBy = "mockExamObj",  fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<MockExamResultText> exam_results = new ArrayList<MockExamResultText>();

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "period_id")
    private Period period;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @OneToOne
    @JoinColumn(name = "grad_sys_id")
    private GradingSystem gradSys;

    @Column
    private java.util.Date exam_year;

    public MockExam() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public List<MockExamResultText> getExam_results() {
        return exam_results;
    }

    public void setExam_results(List<MockExamResultText> exam_results) {
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

    public java.util.Date getExam_year() {
        return exam_year;
    }

    public void setExam_year(java.util.Date exam_year) {
        this.exam_year = exam_year;
    }

    public java.util.Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(java.util.Date created_at) {
        this.created_at = created_at;
    }
}
