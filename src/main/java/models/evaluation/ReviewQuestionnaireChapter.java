package models.evaluation;

import javax.persistence.*;

@Entity
@Table(name = "review_questionnaire_chapters")
public class ReviewQuestionnaireChapter {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;

    public ReviewQuestionnaireChapter() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
