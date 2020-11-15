package models.general;

import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;


@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "buildings")
public class Building {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private String address;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "suburb_id")
    private Suburb suburbObj;

    public Building() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
