package models.groups;

import lombok.Getter;
import lombok.Setter;
import models.exams.MockExam;
import models.people.Teacher;
import models.seminars.SeminarModules;
import org.hibernate.annotations.*;
import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.*;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "groupakia")
public class GroupModel {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private String title;

    @Getter
    @Setter
    @Column
    private int active;

    @Getter
    @Setter
    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @Getter
    @Setter
    @Column
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updated_at;

    @Getter
    @Setter
    @Column
    private int max_seats;

    @Getter
    @Setter
    @Column
    private int remaining_seats;

    @Getter
    @Setter // dropped ???
    @Formula("(SELECT CASE WHEN COUNT(gs.id) IS NULL THEN 0 ELSE COUNT(gs.id) END FROM group_students gs WHERE gs.dropped IS NULL AND gs.group_id = id)")
    private BigDecimal studentsNum;

    @Getter
    @Setter
    @Formula("(SELECT CASE WHEN  SUM(stp.amount) IS NULL THEN 0 ELSE SUM(stp.amount) END FROM student_payed stp WHERE stp.group_id = id)")
    private BigDecimal paymentsSumStudents;

    @Getter
    @Setter
    @Formula("(SELECT CASE WHEN SUM(tp.amount) IS NULL THEN 0 ELSE  SUM(tp.amount) END FROM teacher_payments tp WHERE tp.group_id = id)")
    private BigDecimal paymentsSumTeachers;

    @Getter
    @Setter
    @Formula("(SELECT CASE WHEN SUM(stb.amount) IS NULL THEN 0 ELSE SUM(stb.amount) END FROM student_debts stb WHERE stb.group_id = id)")
    private BigDecimal debtsSumStudents;

    @Getter
    @Setter
    @Formula("(SELECT CASE WHEN SUM(tb.amount) IS NULL THEN 0 ELSE SUM(tb.amount) END FROM teacher_debts tb WHERE tb.group_id = id)")
    private BigDecimal debtsSumTeachers;

    @Getter
    @Setter
    @Formula("(SELECT  CASE WHEN SUM(dbt.amount) - SUM(stp.amount) IS NULL THEN SUM(dbt.amount) ELSE SUM(dbt.amount) - SUM(stp.amount) END " +
            " FROM student_debts dbt " +
            " LEFT JOIN student_payed stp ON stp.group_id=dbt.group_id " +
            " WHERE dbt.group_id = id)")
    private BigDecimal remainingStudentDebt;

    @Getter
    @Setter
    @Formula("(SELECT  CASE WHEN SUM(dbt.amount) - SUM(stp.amount) IS NULL THEN SUM(dbt.amount) ELSE SUM(dbt.amount) - SUM(stp.amount) END " +
            " FROM teacher_debts dbt " +
            " LEFT JOIN teacher_payments stp ON stp.group_id=dbt.group_id " +
            " WHERE dbt.group_id = id)")
    private BigDecimal remainingTeacherDebt;

    @Getter
    @Setter
    @Formula("(SELECT CASE WHEN SUM(h.duration) IS NULL THEN 0 ELSE SUM(h.duration) END FROM history h JOIN groupakia g ON g.id = h.group_id WHERE h.group_id= id)")
    private BigDecimal sumHours;

    @Getter
    @Setter
    @Column
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date ends_at;

    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<HistoryModel> historyList = new ArrayList<HistoryModel>();

    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<MockExam> mockExams = new ArrayList<MockExam>();

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private CourseModel courseObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "age_id")
    private Age ageObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "speed_id")
    private Speed speedObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rank_id")
    private GroupRank rankObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fee_id")
    private CourseFee feeObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "wage_id")
    private CourseWage wageObj;

    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<GroupStudent> studentsList;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinTable(
            name = "groups_extra_teachers",
            joinColumns = @JoinColumn(name = "group_id"),
            inverseJoinColumns = @JoinColumn(name = "teacher_id"))
    private Set<Teacher> teacherSet = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinTable(
            name = "seminar_groups",
            joinColumns = @JoinColumn(name = "group_id"),
            inverseJoinColumns = @JoinColumn(name = "module_id"))
    private Set<SeminarModules> modulesSet = new HashSet<>();

    public GroupModel() {
    }

    public List<HistoryModel> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<HistoryModel> historyList) {
        this.historyList = historyList;
    }

    public List<MockExam> getMockExams() {
        return mockExams;
    }

    public void setMockExams(List<MockExam> mockExams) {
        this.mockExams = mockExams;
    }

    public CourseModel getCourseObj() {
        return courseObj;
    }

    public void setCourseObj(CourseModel courseObj) {
        this.courseObj = courseObj;
    }

    public Age getAgeObj() {
        return ageObj;
    }

    public void setAgeObj(Age ageObj) {
        this.ageObj = ageObj;
    }

    public Speed getSpeedObj() {
        return speedObj;
    }

    public void setSpeedObj(Speed speedObj) {
        this.speedObj = speedObj;
    }

    public List<GroupStudent> getStudentsList() {
        return studentsList;
    }

    public void setStudentsList(List<GroupStudent> studentsList) {
        this.studentsList = studentsList;
    }

    public GroupRank getRankObj() {
        return rankObj;
    }

    public void setRankObj(GroupRank rankObj) {
        this.rankObj = rankObj;
    }

    public CourseFee getFeeObj() {
        return feeObj;
    }

    public void setFeeObj(CourseFee feeObj) {
        this.feeObj = feeObj;
    }

    public CourseWage getWageObj() {
        return wageObj;
    }

    public void setWageObj(CourseWage wageObj) {
        this.wageObj = wageObj;
    }

    public Set<Teacher> getTeacherSet() {
        return teacherSet;
    }

    public void setTeacherSet(Set<Teacher> teacherSet) {
        this.teacherSet = teacherSet;
    }

    public Set<SeminarModules> getModulesSet() {
        return modulesSet;
    }

    public void setModulesSet(Set<SeminarModules> modulesSet) {
        this.modulesSet = modulesSet;
    }
}