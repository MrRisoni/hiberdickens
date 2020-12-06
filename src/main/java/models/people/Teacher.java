package models.people;

import lombok.Getter;
import lombok.Setter;
import models.groups.CourseModel;
import models.people.Member;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Formula;

import javax.persistence.*;

import java.math.BigDecimal;
import java.util.*;

@Entity
@Table(name = "teachers")
public class Teacher {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private String amka;

    @Getter
    @Setter
    @Column
    private String afm;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinTable(name = "teaches",
            joinColumns = @JoinColumn(name = "teacher_id"),
            inverseJoinColumns = @JoinColumn(name = "course_id"))
    private Set<CourseModel> courses = new HashSet<>();

    @Getter
    @Setter
    @Formula("(SELECT COUNT(gs.id) FROM groups_teachers gs WHERE gs.teacher_id = id)")
    private int numGroups;

    @Getter
    @Setter
    @Formula("(SELECT COUNT(ts.id) FROM teaches ts WHERE ts.teacher_id = id)")
    private int numCourses;

    @Getter
    @Setter
    @Column(name = "total_payed")
    private BigDecimal totalPayed;

    @Getter
    @Setter
    @Column(name = "total_debt")
    private BigDecimal remainingDebt;

    @Getter
    @Setter
    @Column(name = "calculated_at")
    private Date calculatedAt;

    public Teacher() {
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Set<CourseModel> getCourses() {
        return courses;
    }

    public void setCourses(Set<CourseModel> courses) {
        this.courses = courses;
    }
}