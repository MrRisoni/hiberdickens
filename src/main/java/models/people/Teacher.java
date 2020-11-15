package models.people;
import models.groups.CourseModel;
import models.people.Member;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Formula;

import javax.persistence.*;

import java.math.BigDecimal;
import java.util.*;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "teachers")
public class Teacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private String amka;


    @Column
    private String afm;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinTable(name="teaches",
                joinColumns = @JoinColumn(name="teacher_id"),
                inverseJoinColumns = @JoinColumn(name="course_id"))
    private Set<CourseModel> courses = new HashSet<>();

    @Formula("(SELECT COUNT(gs.id) FROM groups_teachers gs WHERE gs.teacher_id = id)")
    private int numGroups;

    @Formula("(SELECT COUNT(ts.id) FROM teaches ts WHERE ts.teacher_id = id)")
    private int numCourses;

    @Column(name="total_payed")
    private BigDecimal totalPayed;

    @Column(name="total_debt")
    private BigDecimal remainingDebt;

    @Column(name="calculated_at")
    private Date calculatedAt;

    public Teacher() {
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

    public String getAmka() {
        return amka;
    }

    public void setAmka(String amka) {
        this.amka = amka;
    }

    public String getAfm() {
        return afm;
    }

    public void setAfm(String afm) {
        this.afm = afm;
    }

    public Set<CourseModel> getCourses() {
        return courses;
    }

    public void setCourses(Set<CourseModel> courses) {
        this.courses = courses;
    }

    /*
    public List<GroupModel> getGrouppen() {
        return grouppen;
    }

    public void setGrouppen(List<GroupModel> grouppen) {
        this.grouppen = grouppen;
    } */

    public int getNumGroups() {
        return numGroups;
    }

    public int getNumCourses() {
        return numCourses;
    }

    public BigDecimal getTotalPayed() {
        return totalPayed;
    }

    public BigDecimal getRemainingDebt() {
        return remainingDebt;
    }

    public void setTotalPayed(BigDecimal totalPayed) {
        this.totalPayed = totalPayed;
    }

    public void setRemainingDebt(BigDecimal remainingDebt) {
        this.remainingDebt = remainingDebt;
    }

    public Date getCalculatedAt() {
        return calculatedAt;
    }

    public void setCalculatedAt(Date calculatedAt) {
        this.calculatedAt = calculatedAt;
    }
}
