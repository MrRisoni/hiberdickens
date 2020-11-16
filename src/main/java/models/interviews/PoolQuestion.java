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
@Table(name = "pool_questions")
public class PoolQuestion {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Getter
    @Setter
    @Column
    private String body;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    private List<PoolQuestionAnswer> answersList = new ArrayList<PoolQuestionAnswer>();

    public PoolQuestion() {
    }

    public List<PoolQuestionAnswer> getAnswersList() {
        return answersList;
    }

    public void setAnswersList(List<PoolQuestionAnswer> answersList) {
        this.answersList = answersList;
    }
}
