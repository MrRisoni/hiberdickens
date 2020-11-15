package models.seminars;

import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "seminars")
public class Seminars {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


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


