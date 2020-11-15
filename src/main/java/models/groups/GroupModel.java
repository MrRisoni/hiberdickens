package models.groups;

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
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private String title;

    @Column
    private int active;

    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @Column
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updated_at;

    @Column
    private int max_seats;

    @Column
    private int remaining_seats;

    @Formula("(SELECT IF(COUNT(gs.id) IS NULL,0,COUNT(gs.id)) FROM group_students gs WHERE gs.group_id = id)")
    private BigDecimal studentsNum;

    @Formula("(SELECT IF(SUM(stp.amount) IS NULL,0,SUM(stp.amount))  FROM student_payed stp WHERE stp.group_id = id)")
    private BigDecimal paymentsSumStudents;

    @Formula("(SELECT IF(SUM(tp.amount) IS NULL,0, SUM(tp.amount)) FROM teacher_payments tp WHERE tp.group_id = id)")
    private BigDecimal paymentsSumTeachers;

    @Formula("(SELECT IF(SUM(stb.amount) IS NULL,0,SUM(stb.amount))  FROM student_debts stb WHERE stb.group_id = id)")
    private BigDecimal debtsSumStudents;

    @Formula("(SELECT IF(SUM(tb.amount) IS NULL,0, SUM(tb.amount))  FROM  teacher_debts tb WHERE tb.group_id = id)")
    private BigDecimal debtsSumTeachers;

    @Formula("( SELECT  IF(SUM(dbt.amount) - SUM(stp.amount) IS NULL,0,SUM(dbt.amount) - SUM(stp.amount))  " +
            "    FROM student_payed stp " +
            "    JOIN student_debts dbt ON stp.group_id=dbt.group_id " +
            "    WHERE dbt.group_id = id)")
    private BigDecimal remainingStudentDebt;

    @Formula("( SELECT  IF(SUM(dbt.amount) - SUM(stp.amount) IS NULL,0,SUM(dbt.amount) - SUM(stp.amount))  " +
            "    FROM student_payed stp " +
            "    JOIN student_debts dbt ON stp.group_id=dbt.group_id " +
            "    WHERE dbt.group_id = id)")
    private BigDecimal remainingTeacherDebt;

    @Formula("(SELECT IF(SUM(h.duration) IS NULL,0,SUM(h.duration)) FROM history h JOIN groupakia g ON g.id = h.group_id WHERE h.group_id= id)")
    private BigDecimal sumHours;

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


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public Set<Teacher> getTeacherSet() {
        return teacherSet;
    }

    public void setTeacherSet(Set<Teacher> teacherSet) {
        this.teacherSet = teacherSet;
    }

    public int getMax_seats() {
        return max_seats;
    }

    public void setMax_seats(int max_seats) {
        this.max_seats = max_seats;
    }

    public int getRemaining_seats() {
        return remaining_seats;
    }

    public void setRemaining_seats(int remaining_seats) {
        this.remaining_seats = remaining_seats;
    }


    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public Date getEnds_at() {
        return ends_at;
    }

    public void setEnds_at(Date ends_at) {
        this.ends_at = ends_at;
    }

    public BigDecimal getPaymentsSumStudents() {
        return paymentsSumStudents;
    }

    public void setPaymentsSumStudents(BigDecimal paymentsSumStudents) {
        this.paymentsSumStudents = paymentsSumStudents;
    }

    public BigDecimal getPaymentsSumTeachers() {
        return paymentsSumTeachers;
    }

    public void setPaymentsSumTeachers(BigDecimal paymentsSumTeachers) {
        this.paymentsSumTeachers = paymentsSumTeachers;
    }

    public BigDecimal getDebtsSumStudents() {
        return debtsSumStudents;
    }

    public void setDebtsSumStudents(BigDecimal debtsSumStudents) {
        this.debtsSumStudents = debtsSumStudents;
    }

    public BigDecimal getDebtsSumTeachers() {
        return debtsSumTeachers;
    }

    public void setDebtsSumTeachers(BigDecimal debtsSumTeachers) {
        this.debtsSumTeachers = debtsSumTeachers;
    }

    public BigDecimal getRemainingStudentDebt() {
        return remainingStudentDebt;
    }

    public void setRemainingStudentDebt(BigDecimal remainingStudentDebt) {
        this.remainingStudentDebt = remainingStudentDebt;
    }

    public BigDecimal getRemainingTeacherDebt() {
        return remainingTeacherDebt;
    }

    public void setRemainingTeacherDebt(BigDecimal remainingTeacherDebt) {
        this.remainingTeacherDebt = remainingTeacherDebt;
    }

    public BigDecimal getSumHours() {
        return sumHours;
    }

    public void setSumHours(BigDecimal sumHours) {
        this.sumHours = sumHours;
    }

    public Set<SeminarModules> getModulesSet() {
        return modulesSet;
    }

    public void setModulesSet(Set<SeminarModules> modulesSet) {
        this.modulesSet = modulesSet;
    }

    public BigDecimal getStudentsNum() {
        return studentsNum;
    }

    public void setStudentsNum(BigDecimal studentsNum) {
        this.studentsNum = studentsNum;
    }
}
