package models;


import javax.persistence.*;

@Entity
@Table(name = "mock_exams_results_text")
public class MockExamResultText {
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
