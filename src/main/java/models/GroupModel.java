package models;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "groupakia")
public class GroupModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @Column
    private String title;




    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private List<HistoryModel> historyList = new ArrayList<>();

    public GroupModel() {
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


    public List<HistoryModel> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<HistoryModel> historyList) {
        this.historyList = historyList;
    }
}
