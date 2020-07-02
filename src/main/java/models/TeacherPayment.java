package models;


import javax.persistence.*;
import java.time.Year;

@Entity
@Table(name = "teacher_payments")
public class TeacherPayment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private float amount;

    @Column
    private int lesson_year;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacher_id")
    private Teacher teacherObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id")
    private GroupModel groupObj;


    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "month_id")
    private Month monthObj;


    public TeacherPayment() {
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

    public Teacher getTeacherObj() {
        return teacherObj;
    }

    public void setTeacherObj(Teacher teacherObj) {
        this.teacherObj = teacherObj;
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
