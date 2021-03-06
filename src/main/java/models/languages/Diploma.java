package models.languages;

import lombok.Getter;
import lombok.Setter;
import models.groups.CourseModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CreationTimestamp;
import javax.persistence.*;
import java.util.Date;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "diplomas")
public class Diploma {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private int active;

    @Getter
    @Setter
    @Column
    private String lvl;

    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "course_id")
    private CourseModel cours;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "language_id")
    private Language langObj;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "institut_id")
    private Institut instObj;

    public Diploma() {
    }

    public CourseModel getCours() {
        return cours;
    }

    public void setCours(CourseModel cours) {
        this.cours = cours;
    }

    public Language getLangObj() {
        return langObj;
    }

    public void setLangObj(Language langObj) {
        this.langObj = langObj;
    }

    public Institut getInstObj() {
        return instObj;
    }

    public void setInstObj(Institut instObj) {
        this.instObj = instObj;
    }
}
