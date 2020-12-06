package models.people;

import lombok.Getter;
import lombok.Setter;
import models.money.Discount;
import models.money.StudentDebt;
import models.people.Absency;
import models.people.Member;
import models.people.ParentsModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.*;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "students")
public class Student {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_id")
    private Member member;

    @Getter
    @Setter
    @Formula("(SELECT MAX(stp.created_at) FROM student_payed stp WHERE stp.student_id = id)")
    private Date lastPaymentDate;

    @Getter
    @Setter
    @Column(name = "total_payed")
    private BigDecimal totalPayed;

    @Getter
    @Setter
    @Formula("(SELECT CASE WHEN SUM(tdb.amount) IS NULL THEN 0 ELSE SUM(tdb.amount) END FROM student_debts tdb WHERE tdb.student_id = id)")
    private BigDecimal totalDebt;

    @Getter
    @Setter
    @Column(name = "total_debt")
    private BigDecimal remainingDebt;

    @Getter
    @Setter
    @Column(name = "calculated_at")
    private Date calculatedAt;

    @Getter
    @Setter
    @Formula("(SELECT COUNT(gs.id) FROM group_students gs WHERE gs.student_id = id)")
    private int numGroups;

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<StudentDebt> debtsList = new ArrayList<StudentDebt>();

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<Absency> absenciesList = new ArrayList<Absency>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinTable(
            name = "parents_children",
            joinColumns = @JoinColumn(name = "child_id"),
            inverseJoinColumns = @JoinColumn(name = "parent_id"))
    private Set<ParentsModel> parents = new HashSet<>();

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
    private List<Discount> discountList = new ArrayList<>();

    public Student() {
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

    public Set<ParentsModel> getParents() {
        return parents;
    }

    public List<Discount> getDiscountList() {
        return discountList;
    }

    public void setDiscountList(List<Discount> discountList) {
        this.discountList = discountList;
    }
}