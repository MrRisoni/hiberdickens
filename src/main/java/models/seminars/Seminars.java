package models.seminars;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "seminars")
public class Seminars {
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

    @OneToOne
    @JoinColumn(name="seninar_category_id")
    private SeminarsCategory semiCatObj;

    @OneToMany
    @JoinColumn(name="seninar_id")
    private List<SeminarModules> modules = new ArrayList<>();


    public Seminars() {
    }

    public SeminarsCategory getSemiCatObj() {
        return semiCatObj;
    }

    public void setSemiCatObj(SeminarsCategory semiCatObj) {
        this.semiCatObj = semiCatObj;
    }

    public List<SeminarModules> getModules() {
        return modules;
    }

    public void setModules(List<SeminarModules> modules) {
        this.modules = modules;
    }
}


