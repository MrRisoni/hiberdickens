package hqlmappers;

import java.math.BigDecimal;
import java.util.Date;

public class GroupRecord {
    private Long id;
    private String title;
    private String speed;
    private String age;
    private BigDecimal wage;
    private BigDecimal fee;
    private Date started;
    private Date ends;
    private BigDecimal numStudents;
    private BigDecimal hours;
    private BigDecimal sumPaymentsTeachers;
    private BigDecimal sumPaymentsStudents;
    private BigDecimal debtsTeachers;
    private BigDecimal debtsStudents;

    public GroupRecord(Long id, String title, String speed, String age, BigDecimal f, BigDecimal w, Date started, Date ends, BigDecimal numStudents, BigDecimal hours, BigDecimal sumPaymentsTeachers, BigDecimal sumPaymentsStudents, BigDecimal debtsTeachers, BigDecimal debtsStudents) {
        this.id = id;
        this.title = title;
        this.speed = speed;
        this.age = age;
        this.started = started;
        this.ends = ends;
        this.numStudents = numStudents;
        this.hours = hours;
        this.sumPaymentsTeachers = sumPaymentsTeachers;
        this.sumPaymentsStudents = sumPaymentsStudents;
        this.debtsTeachers = debtsTeachers;
        this.debtsStudents = debtsStudents;
        this.fee =f;
        this.wage = w;
        this.wage = w;
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

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public Date getStarted() {
        return started;
    }

    public void setStarted(Date started) {
        this.started = started;
    }

    public Date getEnds() {
        return ends;
    }

    public void setEnds(Date ends) {
        this.ends = ends;
    }

    public BigDecimal getNumStudents() {
        return numStudents;
    }

    public void setNumStudents(BigDecimal numStudents) {
        this.numStudents = numStudents;
    }

    public BigDecimal getHours() {
        return hours;
    }

    public void setHours(BigDecimal hours) {
        this.hours = hours;
    }

    public BigDecimal getSumPaymentsTeachers() {
        return sumPaymentsTeachers;
    }

    public void setSumPaymentsTeachers(BigDecimal sumPaymentsTeachers) {
        this.sumPaymentsTeachers = sumPaymentsTeachers;
    }

    public BigDecimal getSumPaymentsStudents() {
        return sumPaymentsStudents;
    }

    public void setSumPaymentsStudents(BigDecimal sumPaymentsStudents) {
        this.sumPaymentsStudents = sumPaymentsStudents;
    }

    public BigDecimal getDebtsTeachers() {
        return debtsTeachers;
    }

    public void setDebtsTeachers(BigDecimal debtsTeachers) {
        this.debtsTeachers = debtsTeachers;
    }

    public BigDecimal getDebtsStudents() {
        return debtsStudents;
    }

    public void setDebtsStudents(BigDecimal debtsStudents) {
        this.debtsStudents = debtsStudents;
    }

    public BigDecimal getWage() {
        return wage;
    }

    public void setWage(BigDecimal wage) {
        this.wage = wage;
    }

    public BigDecimal getFee() {
        return fee;
    }

    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }
}
