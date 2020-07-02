package models;

import sun.misc.Perf;

import javax.persistence.*;

@Entity
@Table(name = "towns")
public class Town {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;


    @OneToOne
    @JoinColumn(name = "perfecture_id")
    private Perfecture perfectObj;


    public Town() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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
