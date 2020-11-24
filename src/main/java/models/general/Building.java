package models.general;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "buildings")
public class Building {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private String address;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "suburb_id")
    private Suburb suburbObj;

    public Building() {
    }
    public Suburb getSuburbObj() {
        return suburbObj;
    }

    public void setSuburbObj(Suburb suburbObj) {
        this.suburbObj = suburbObj;
    }
}
