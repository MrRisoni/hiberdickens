package models;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "diplomas")
public class Diploma {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private int active;

    @Column
    private String level;

    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @OneToOne
    @JoinColumn(name = "course_id")
    private CourseModel cours;

    @OneToOne
    @JoinColumn(name = "language_id")
    private Language langObj;

    @OneToOne
    @JoinColumn(name = "institut_id")
    private Institut instObj;

    public Diploma() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }


    public CourseModel getCours() {
        return cours;
    }

    public void setCours(CourseModel cours) {
        this.cours = cours;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
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
