package models.general;

import models.general.Perfecture;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;


@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "towns")
public class Town {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private String title;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "perfecture_id")
    private Perfecture perfectObj;

    public Town() {
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

    public Perfecture getPerfectObj() {
        return perfectObj;
    }

    public void setPerfectObj(Perfecture perfectObj) {
        this.perfectObj = perfectObj;
    }
}
