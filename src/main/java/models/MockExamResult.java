package models;


import javax.persistence.*;

@Entity
@Table(name = "mock_exams_results")
public class MockExamResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private  float grade;


    @OneToOne
    @JoinColumn(name = "student_id")
    private Student student;

    public MockExamResult() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
