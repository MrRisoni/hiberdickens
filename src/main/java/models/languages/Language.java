package models.languages;

import lombok.Getter;
import lombok.Setter;
import models.languages.Diploma;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "languages")
public class Language {
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

    @Getter
    @Setter
    @Column
    private int active;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "language_id")
    private List<Diploma> diplomas = new ArrayList<Diploma>();

    @Getter
    @Setter
    @Formula("( SELECT COUNT(DISTINCT(t.teacher_id)) FROM diplomas d JOIN teaches t ON t.course_id = d.course_id WHERE d.language_id = id)")
    private Long numSpeakers;

    public Language() {
    }

    public List<Diploma> getDiplomas() {
        return diplomas;
    }

    public void setDiplomas(List<Diploma> diplomas) {
        this.diplomas = diplomas;
    }
}