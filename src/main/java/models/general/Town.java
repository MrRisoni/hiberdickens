package models.general;

import lombok.Getter;
import lombok.Setter;
import models.general.Perfecture;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Table(name = "towns")
public class Town {
    @Getter
    @Setter
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

    public Perfecture getPerfectObj() {
        return perfectObj;
    }

    public void setPerfectObj(Perfecture perfectObj) {
        this.perfectObj = perfectObj;
    }
}
