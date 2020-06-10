package models;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "groups")
public class GroupModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @Column
    private String title;




    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<GroupModel> historyList = new ArrayList<>();

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


    public List<GroupModel> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<GroupModel> historyList) {
        this.historyList = historyList;
    }
}
