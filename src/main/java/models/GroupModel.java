package models;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.*;

@Entity
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

    @Column
    private int num_students;

    @Column
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date ends_at;


    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<HistoryModel> historyList = new ArrayList<HistoryModel>();

    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
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


   /* @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinTable(
            name = "group_students",
            joinColumns = @JoinColumn(name = "group_id")) */
   @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
   private List<GroupStudent> studentsList;

   @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true,fetch = FetchType.LAZY)
   @JoinTable(
           name = "groups_extra_teachers",
           joinColumns = @JoinColumn(name = "group_id"),
           inverseJoinColumns=@JoinColumn(name="teacher_id"))
   private Set<Teacher> teacherSet = new HashSet<>();

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

    public int getNum_students() {
        return num_students;
    }

    public void setNum_students(int num_students) {
        this.num_students = num_students;
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
}
