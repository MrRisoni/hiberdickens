package models.languages;
import models.languages.Diploma;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "languages")
public class Language {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;


    @Column
    private String title;


    @Column
    private int active;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="language_id")
    private List<Diploma> diplomas = new ArrayList<Diploma>();


    public Language() {
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

    public List<Diploma> getDiplomas() {
        return diplomas;
    }

    public void setDiplomas(List<Diploma> diplomas) {
        this.diplomas = diplomas;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
