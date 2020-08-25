package models.exams;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import models.exams.MockExamResultText;
import models.groups.GroupModel;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "real_exams")
public class RealExam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="group_id", nullable=false)
    @JsonIgnoreProperties("mockExams")
    private GroupModel groupObj;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="exam_id")
    private List<MockExamResultText> exam_results = new ArrayList<MockExamResultText>();

    @Column
    private java.sql.Date exam_year;


    public RealExam() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<MockExamResultText> getExam_results() {
        return exam_results;
    }

    public void setExam_results(List<MockExamResultText> exam_results) {
        this.exam_results = exam_results;
    }

    public Date getExam_year() {
        return exam_year;
    }

    public void setExam_year(Date exam_year) {
        this.exam_year = exam_year;
    }
}
