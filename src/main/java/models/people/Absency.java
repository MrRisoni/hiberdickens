package models.people;

import models.groups.HistoryModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;


@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "absencies")
public class Absency {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private int justified;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "history_id")
    private HistoryModel histObj;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "student_id")
    private Student studentObj;


    public Absency() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getJustified() {
        return justified;
    }

    public void setJustified(int justified) {
        this.justified = justified;
    }

    public HistoryModel getHistObj() {
        return histObj;
    }

    public void setHistObj(HistoryModel histObj) {
        this.histObj = histObj;
    }

    public Student getStudObj() {
        return studentObj;
    }

    public void setStudObj(Student studObj) {
        this.studentObj = studObj;
    }
}
