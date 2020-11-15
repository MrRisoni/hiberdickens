package models.money;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import models.people.Student;
import models.general.Month;
import models.groups.GroupModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;


@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "student_debts")
public class StudentDebt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private float amount;


    @Column
    private int lesson_year;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="student_id", nullable=false)
    @JsonIgnoreProperties("debtsList")
    private Student studentObj;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "group_id")
    private GroupModel groupObj;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "month_id")
    private Month monthObj;

    public StudentDebt() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
