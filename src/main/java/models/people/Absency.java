package models.people;

import lombok.Getter;
import lombok.Setter;
import models.groups.HistoryModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

@Entity
@Table(name = "absencies")
public class Absency {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
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
