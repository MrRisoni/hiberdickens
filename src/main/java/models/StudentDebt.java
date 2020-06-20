package models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "student_debts")
public class StudentDebt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private float amount;

    @Column
    private int lesson_year;

    @Column
    private  int group_id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="student_id", nullable=false)
    @JsonIgnoreProperties("debtsList")
    private Student studentObj;

    public StudentDebt() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public int getLesson_year() {
        return lesson_year;
    }

    public void setLesson_year(int lesson_year) {
        this.lesson_year = lesson_year;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }
}
