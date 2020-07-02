package models;
import javax.persistence.*;

@Entity
@Table(name = "buildings")
public class Building {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String address;

    @OneToOne
    @JoinColumn(name = "suburb_id")
    private Suburb suburbObj;

    public Building() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Suburb getSuburbObj() {
        return suburbObj;
    }

    public void setSuburbObj(Suburb suburbObj) {
        this.suburbObj = suburbObj;
    }
}
