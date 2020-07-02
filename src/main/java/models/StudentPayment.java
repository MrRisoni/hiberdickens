package models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "student_payed")
public class StudentPayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private float amount;

    @Column
    private int lesson_year;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="student_id", nullable=false)
    @JsonIgnoreProperties("debtsList")
    private Student studentObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id")
    private GroupModel groupObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "month_id")
    private Month monthObj;

    public StudentPayment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public int getLesson_year() {
        return lesson_year;
    }

    public void setLesson_year(int lesson_year) {
        this.lesson_year = lesson_year;
    }


    public Student getStudentObj() {
        return studentObj;
    }

    public void setStudentObj(Student studentObj) {
        this.studentObj = studentObj;
    }

    public GroupModel getGroupObj() {
        return groupObj;
    }

    public void setGroupObj(GroupModel groupObj) {
        this.groupObj = groupObj;
    }

    public Month getMonthObj() {
        return monthObj;
    }

    public void setMonthObj(Month monthObj) {
        this.monthObj = monthObj;
    }
}
