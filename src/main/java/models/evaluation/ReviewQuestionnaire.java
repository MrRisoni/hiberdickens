package models.evaluation;


import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "review_questionnaire")
public class ReviewQuestionnaire {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinColumn(name = "questionnaire_id")
    private List<ReviewQuestionnaireQuestion> questionsList = new ArrayList<ReviewQuestionnaireQuestion>();

    public ReviewQuestionnaire() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<ReviewQuestionnaireQuestion> getQuestionsList() {
        return questionsList;
    }

    public void setQuestionsList(List<ReviewQuestionnaireQuestion> questionsList) {
        this.questionsList = questionsList;
    }
}
