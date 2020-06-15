package models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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

    @Column
    private String title;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="group_id", nullable=false)
    @JsonIgnoreProperties("mockExams")
    private GroupModel groupObj;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="exam_id")
    private List<MockExamResult> exam_results = new ArrayList<MockExamResult>();

    public MockExam() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<MockExamResult> getExam_results() {
        return exam_results;
    }

    public void setExam_results(List<MockExamResult> exam_results) {
        this.exam_results = exam_results;
    }
}
