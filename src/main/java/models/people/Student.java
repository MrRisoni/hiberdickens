package models.people;


import models.money.Discount;
import models.money.StudentDebt;
import models.people.Absency;
import models.people.Member;
import models.people.ParentsModel;
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

    @Column(name="total_profit")
    private BigDecimal totalPayed;

    @Formula("(SELECT IF(SUM(tdb.amount) IS NULL,0,SUM(tdb.amount)) FROM student_debts tdb WHERE tdb.student_id = id)")
    private BigDecimal totalDebt;

    @Column(name="total_debt")
    private BigDecimal remainingDebt;

    @Column(name="calculated_at")
    private Date calculatedAt;

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

    public BigDecimal getRemainingDebt() {
        return remainingDebt;
    }

    public void setRemainingDebt(BigDecimal remainingDebt) {
        this.remainingDebt = remainingDebt;
    }


    public List<Discount> getDiscountList() {
        return discountList;
    }

    public void setDiscountList(List<Discount> discountList) {
        this.discountList = discountList;
    }

    public Date getCalculatedAt() {
        return calculatedAt;
    }

    public void setCalculatedAt(Date calculatedAt) {
        this.calculatedAt = calculatedAt;
    }
}
