package models.evaluation;



import models.interviews.PoolReviewQuestion;

import javax.persistence.*;

@Entity
@Table(name = "review_questionnaire_questions")
public class ReviewQuestionnaireQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chapter_id")
    private ReviewQuestionnaireChapter chapterObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    private PoolReviewQuestion questionObj;

    public ReviewQuestionnaireQuestion() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ReviewQuestionnaireChapter getChapterObj() {
        return chapterObj;
    }

    public void setChapterObj(ReviewQuestionnaireChapter chapterObj) {
        this.chapterObj = chapterObj;
    }

    public PoolReviewQuestion getQuestionObj() {
        return questionObj;
    }

    public void setQuestionObj(PoolReviewQuestion questionObj) {
        this.questionObj = questionObj;
    }
}
