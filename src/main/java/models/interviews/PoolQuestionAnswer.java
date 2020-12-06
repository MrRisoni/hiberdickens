package models.interviews;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Table(name = "pool_question_answers")
public class PoolQuestionAnswer {
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

    @Getter
    @Setter
    @Column
    private int wrong;

    public PoolQuestionAnswer(int id, String body) {
        this.id = id;
        this.body = body;
    }

    public PoolQuestionAnswer() {
    }
}