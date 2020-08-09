package models;


import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.*;

@Entity
@Table(name = "students")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "member_id")
    private Member member;

    @Formula("(SELECT MAX(stp.created_at) FROM student_payed stp WHERE stp.student_id = id)")
    private Date lastPaymentDate;

    @Formula("(SELECT IF(SUM(tp.amount) IS NULL,0,SUM(tp.amount)) FROM student_payed tp WHERE tp.student_id = id)")
    private BigDecimal totalPayed;

    @Formula("(SELECT IF(SUM(tdb.amount) IS NULL,0,SUM(tdb.amount)) FROM student_debts tdb WHERE tdb.student_id = id)")
    private BigDecimal totalDebt;

    @Formula("( SELECT  IF(SUM(dbt.amount) - SUM(stp.amount) IS NULL,0,SUM(dbt.amount) - SUM(stp.amount))  " +
            "    FROM student_payed stp " +
            "    JOIN student_debts dbt ON stp.student_id=dbt.student_id " +
            "    WHERE dbt.student_id = id)")
    private float remainingDebt;

    @Formula("(SELECT COUNT(gs.id) FROM group_students gs WHERE gs.student_id = id)")
    private int numGroups;


    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<StudentDebt> debtsList = new ArrayList<StudentDebt>();

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<Absency> absenciesList = new ArrayList<Absency>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinTable(
            name = "parents_children",
            joinColumns = @JoinColumn(name = "child_id"),
            inverseJoinColumns=@JoinColumn(name="parent_id"))
    private Set<ParentsModel> parents = new HashSet<>();

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
    private List<Discount> discountList = new ArrayList<>();

    public Student() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public List<StudentDebt> getDebtsList() {
        return debtsList;
    }

    public void setDebtsList(List<StudentDebt> debtsList) {
        this.debtsList = debtsList;
    }

    public List<Absency> getAbsenciesList() {
        return absenciesList;
    }

    public void setAbsenciesList(List<Absency> absenciesList) {
        this.absenciesList = absenciesList;
    }

    public Date getLastPaymentDate() {
        return lastPaymentDate;
    }

    public void setLastPaymentDate(Date lastPaymentDate) {
        this.lastPaymentDate = lastPaymentDate;
    }

    public BigDecimal getTotalPayed() {
        return totalPayed;
    }

    public BigDecimal getTotalDebt() {
        return totalDebt;
    }

    public Set<ParentsModel> getParents() {
        return parents;
    }

    public void setTotalPayed(BigDecimal totalPayed) {
        this.totalPayed = totalPayed;
    }

    public void setTotalDebt(BigDecimal totalDebt) {
        this.totalDebt = totalDebt;
    }

    public int getNumGroups() {
        return numGroups;
    }

    public void setNumGroups(int numGroups) {
        this.numGroups = numGroups;
    }

    public float getRemainingDebt() {
        return remainingDebt;
    }

    public void setRemainingDebt(float remainingDebt) {
        this.remainingDebt = remainingDebt;
    }


    public List<Discount> getDiscountList() {
        return discountList;
    }

    public void setDiscountList(List<Discount> discountList) {
        this.discountList = discountList;
    }
}
