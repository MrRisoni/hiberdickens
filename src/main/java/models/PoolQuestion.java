package models;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "pool_questions")
public class PoolQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String body;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    private List<PoolQuestionAnswer> answersList = new ArrayList<PoolQuestionAnswer>();

    public PoolQuestion() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public List<PoolQuestionAnswer> getAnswersList() {
        return answersList;
    }

    public void setAnswersList(List<PoolQuestionAnswer> answersList) {
        this.answersList = answersList;
    }
}
