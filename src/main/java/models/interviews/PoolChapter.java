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
@Table(name = "pool_chapters")
public class PoolChapter {
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

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "chapter_id")
    private List<PoolQuestion> questionsList = new ArrayList<PoolQuestion>();

    public PoolChapter() {
    }

    public List<PoolQuestion> getQuestionsList() {
        return questionsList;
    }

    public void setQuestionsList(List<PoolQuestion> questionsList) {
        this.questionsList = questionsList;
    }
}
