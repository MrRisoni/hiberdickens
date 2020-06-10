package models;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "history")
public class HistoryModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


   /* @ManyToOne(fetch = FetchType.LAZY )
    @JoinColumn(name="group_id", nullable=false)
    private GroupModel groupObj; */

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date started;


    @Column(name="group_id")
    private int groupId;


    public HistoryModel() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /*public GroupModel getGroupObj() {
        return groupObj;
    }

    public void setGroupObj(GroupModel groupObj) {
        this.groupObj = groupObj;
    } */

    public Date getStarted() {
        return started;
    }

    public void setStarted(Date started) {
        this.started = started;
    }


    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }
}
