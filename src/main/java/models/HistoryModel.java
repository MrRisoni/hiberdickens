package models;
import javax.persistence.*;

@Entity
@Table(name = "history")
public class HistoryModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @ManyToOne(fetch = FetchType.EAGER )
    @JoinColumn(name="group_id", nullable=false)
    private GroupModel groupObj;


    public HistoryModel() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public GroupModel getGroupObj() {
        return groupObj;
    }

    public void setGroupObj(GroupModel groupObj) {
        this.groupObj = groupObj;
    }
}
