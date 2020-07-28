package models;


import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @Formula("(SELECT SUM(tp.amount) FROM student_payed tp WHERE tp.student_id = id)")
    private BigDecimal totalPayed;

    @Formula("(SELECT SUM(tdb.amount) FROM student_debts tdb WHERE tdb.student_id = id)")
    private BigDecimal totalDebt;

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<StudentDebt> debtsList = new ArrayList<StudentDebt>();

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<Absency> absenciesList = new ArrayList<Absency>();


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

}
