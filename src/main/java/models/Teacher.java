package models;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "teachers")
public class Teacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @NotNull
    @Column
    private String amka;

    @NotNull
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

    @Formula("(SELECT SUM(tp.amount) FROM teacher_payments tp WHERE tp.teacher_id = id)")
    private BigDecimal totalPayed;


    @Formula("( SELECT  IF(SUM(dbt.amount) - SUM(stp.amount) IS NULL,0,SUM(dbt.amount) - SUM(stp.amount))  " +
            "    FROM teacher_payments stp " +
            "    JOIN teacher_debts  dbt ON stp.teacher_id=dbt.teacher_id " +
            "    WHERE dbt.teacher_id = id)")
    private float remainingDebt;

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

    public float getRemainingDebt() {
        return remainingDebt;
    }
}
