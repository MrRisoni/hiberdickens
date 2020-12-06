package models.general;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Table(name = "suburbs")
public class Suburb {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private String title;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "town_id")
    private Town townObj;

    public Suburb() {
    }

    public Town getTownObj() {
        return townObj;
    }

    public void setTownObj(Town townObj) {
        this.townObj = townObj;
    }
}
