package models.exams;

import lombok.Getter;
import lombok.Setter;
import models.people.Student;
import models.groups.CourseGrade;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "mock_exams_results_text")
public class MockExamResultText {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "student_id")
    private Student student;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "exam_id")
    private MockExam mockExamObj;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "text_grade_id")
    private CourseGrade gradeObj;

    public MockExamResultText() {
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public MockExam getMockExamObj() {
        return mockExamObj;
    }

    public void setMockExamObj(MockExam mockExamObj) {
        this.mockExamObj = mockExamObj;
    }

    public CourseGrade getGradeObj() {
        return gradeObj;
    }

    public void setGradeObj(CourseGrade gradeObj) {
        this.gradeObj = gradeObj;
    }
}
