package models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "pool_chapters")
public class PoolChapter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "chapter_id")
    private List<PoolQuestion> questionsList = new ArrayList<PoolQuestion>();

    public PoolChapter() {
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

    public List<PoolQuestion> getQuestionsList() {
        return questionsList;
    }

    public void setQuestionsList(List<PoolQuestion> questionsList) {
        this.questionsList = questionsList;
    }
}
