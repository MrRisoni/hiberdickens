package models.money;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "payroll_analysis")
public class PayRollAnalysis {
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

    @ManyToOne
    @JoinColumn(name = "payroll_id")
    @JsonIgnoreProperties("analysis")
    private PayRoll payrollObj;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "payroll_category_id")
    private PayRollCategory payRollCatObj;

    public PayRollAnalysis() {
    }

    public PayRoll getPayrollObj() {
        return payrollObj;
    }

    public void setPayrollObj(PayRoll payrollObj) {
        this.payrollObj = payrollObj;
    }

    public PayRollCategory getPayRollCatObj() {
        return payRollCatObj;
    }

    public void setPayRollCatObj(PayRollCategory payRollCatObj) {
        this.payRollCatObj = payRollCatObj;
    }
}
