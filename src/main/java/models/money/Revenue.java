package models.money;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "revenue")
public class Revenue {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column(name = "profit")
    private BigDecimal profit;

    @Column(name = "gross_income")
    private BigDecimal grossIncome;

    @Column(name = "net_income")
    private BigDecimal netIncome;

    @Column(name = "student_payments")
    private BigDecimal studentPayments;

    @Column(name = "total_expenses")
    private BigDecimal totalExpenses;

    @Column(name = "taxes")
    private BigDecimal taxes;

    @Column(name = "staff_payments")
    private BigDecimal staffPayments;

    @Column(name = "staff_insurances")
    private BigDecimal staffInsurances;

    @Column(name = "staff_net_payments")
    private BigDecimal staffNetPayments;

    @Column(name = "student_debts")
    private BigDecimal studentDebts;

    @Column(name = "staff_in_debt")
    private BigDecimal staffInDebt;

    @Temporal(TemporalType.DATE)
    @CreationTimestamp
    @Column(name = "created_at")
    private Date createdAt;


    public Revenue() {
    }

    public Revenue(Long id) {
        this.id = id;
    }

    public Revenue(Long id, BigDecimal profit, BigDecimal grossIncome, BigDecimal netIncome, BigDecimal studentPayments, BigDecimal totalExpenses, BigDecimal taxes, BigDecimal staffPayments, BigDecimal staffInsurances, BigDecimal staffNetPayments, BigDecimal studentDebts, BigDecimal staffInDebt) {
        this.id = id;
        this.profit = profit;
        this.grossIncome = grossIncome;
        this.netIncome = netIncome;
        this.studentPayments = studentPayments;
        this.totalExpenses = totalExpenses;
        this.taxes = taxes;
        this.staffPayments = staffPayments;
        this.staffInsurances = staffInsurances;
        this.staffNetPayments = staffNetPayments;
        this.studentDebts = studentDebts;
        this.staffInDebt = staffInDebt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getProfit() {
        return profit;
    }

    public void setProfit(BigDecimal profit) {
        this.profit = profit;
    }

    public BigDecimal getGrossIncome() {
        return grossIncome;
    }

    public void setGrossIncome(BigDecimal grossIncome) {
        this.grossIncome = grossIncome;
    }

    public BigDecimal getNetIncome() {
        return netIncome;
    }

    public void setNetIncome(BigDecimal netIncome) {
        this.netIncome = netIncome;
    }

    public BigDecimal getStudentPayments() {
        return studentPayments;
    }

    public void setStudentPayments(BigDecimal studentPayments) {
        this.studentPayments = studentPayments;
    }

    public BigDecimal getTotalExpenses() {
        return totalExpenses;
    }

    public void setTotalExpenses(BigDecimal totalExpenses) {
        this.totalExpenses = totalExpenses;
    }

    public BigDecimal getTaxes() {
        return taxes;
    }

    public void setTaxes(BigDecimal taxes) {
        this.taxes = taxes;
    }

    public BigDecimal getStaffPayments() {
        return staffPayments;
    }

    public void setStaffPayments(BigDecimal staffPayments) {
        this.staffPayments = staffPayments;
    }

    public BigDecimal getStaffInsurances() {
        return staffInsurances;
    }

    public void setStaffInsurances(BigDecimal staffInsurances) {
        this.staffInsurances = staffInsurances;
    }

    public BigDecimal getStaffNetPayments() {
        return staffNetPayments;
    }

    public void setStaffNetPayments(BigDecimal staffNetPayments) {
        this.staffNetPayments = staffNetPayments;
    }

    public BigDecimal getStudentDebts() {
        return studentDebts;
    }

    public void setStudentDebts(BigDecimal studentDebts) {
        this.studentDebts = studentDebts;
    }

    public BigDecimal getStaffInDebt() {
        return staffInDebt;
    }

    public void setStaffInDebt(BigDecimal staffInDebt) {
        this.staffInDebt = staffInDebt;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
