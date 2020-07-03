package models;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "test_chapters")
public class TestChapterModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="chapter_id")
    private List<TestQuestion> questionsList = new ArrayList<TestQuestion>();


    public TestChapterModel() {
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

    public List<TestQuestion> getQuestionsList() {
        return questionsList;
    }

    public void setQuestionsList(List<TestQuestion> questionsList) {
        this.questionsList = questionsList;
    }
}
