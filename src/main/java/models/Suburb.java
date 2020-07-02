package models;

import javax.persistence.*;

@Entity
@Table(name = "suburbs")
public class Suburb {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;

    @OneToOne
    @JoinColumn(name = "town_id")
    private Town townObj;

    public Suburb() {
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

    public Town getTownObj() {
        return townObj;
    }

    public void setTownObj(Town townObj) {
        this.townObj = townObj;
    }
}