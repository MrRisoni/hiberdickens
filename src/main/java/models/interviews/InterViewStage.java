package models.interviews;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "interview_stages")
public class InterViewStage {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Getter
    @Setter
    @Column
    private String title;

    @Getter
    @Setter
    @Column
    private int active;

    @Getter
    @Setter
    @Column
    private int shown_order;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinColumn(name = "stage_id")
    private List<InterViewGrade> gradesList = new ArrayList<InterViewGrade>();

    public InterViewStage() {
    }

    public List<InterViewGrade> getGradesList() {
        return gradesList;
    }

    public void setGradesList(List<InterViewGrade> gradesList) {
        this.gradesList = gradesList;
    }
}
