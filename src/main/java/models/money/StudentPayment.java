package models.money;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import models.people.Student;
import models.general.Month;
import models.groups.GroupModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;


@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "student_payed")
public class StudentPayment {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private float amount;

    @Getter
    @Setter
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

    public StudentPayment() {
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
