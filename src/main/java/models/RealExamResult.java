package models;


import javax.persistence.*;

@Entity
@Table(name = "real_exams_results")
public class RealExamResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private  float grade;

    @OneToOne
    @JoinColumn(name = "student_id")
    private Student student;

    public RealExamResult() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
