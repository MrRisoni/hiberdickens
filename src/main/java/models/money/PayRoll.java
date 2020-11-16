package models.money;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import models.people.Teacher;
import models.general.Month;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CreationTimestamp;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "payroll")
public class PayRoll {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private  float gross;

    @Getter
    @Setter
    @Column
    private  float insurances;

    @Getter
    @Setter
    @Column
    private  float total_hours;

    @Getter
    @Setter
    @Column
    private  float net;

    @Getter
    @Setter
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date fiscal_year;

    @Getter
    @Setter
    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date created_at;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "teacher_id")
    private Teacher teacherObj;

    @OneToOne
    @JoinColumn(name = "month_id")
    private Month monthObj;

    @OneToMany(mappedBy = "payrollObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JsonIgnoreProperties("payrollObj")
    private List<PayRollAnalysis> analysis = new ArrayList<PayRollAnalysis>();

    public PayRoll() {
    }

    public Teacher getTeacherObj() {
        return teacherObj;
    }

    public void setTeacherObj(Teacher teacherObj) {
        this.teacherObj = teacherObj;
    }

    public Month getMonthObj() {
        return monthObj;
    }

    public void setMonthObj(Month monthObj) {
        this.monthObj = monthObj;
    }

    public List<PayRollAnalysis> getAnalysis() {
        return analysis;
    }

    public void setAnalysis(List<PayRollAnalysis> analysis) {
        this.analysis = analysis;
    }
}
