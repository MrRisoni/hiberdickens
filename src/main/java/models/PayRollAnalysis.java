package models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "payroll_analysis")
public class PayRollAnalysis {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

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
