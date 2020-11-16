package models.money;

import lombok.Data;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Data
@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
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
}