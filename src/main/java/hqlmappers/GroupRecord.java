package hqlmappers;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
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
        this.fee = f;
        this.wage = w;
        this.wage = w;
    }
}