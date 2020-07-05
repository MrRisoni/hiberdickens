package models;


import javax.persistence.*;

@Entity
@Table(name = "pool_question_answers")
public class PoolQuestionAnswer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String body;

    @Column
    private int wrong;

    public PoolQuestionAnswer(int id, String body) {
        this.id = id;
        this.body = body;
    }

    public PoolQuestionAnswer() {
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

    public int getWrong() {
        return wrong;
    }

    public void setWrong(int wrong) {
        this.wrong = wrong;
    }
}
