package models;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "history")
@NamedEntityGraphs(value = {
        @NamedEntityGraph(name="HistoryModel.grouppen",attributeNodes=@NamedAttributeNode("groupObj")),
        @NamedEntityGraph(name = "HistoryModel.nogroupObj")

})
public class HistoryModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


   @ManyToOne(fetch = FetchType.LAZY )
    @JoinColumn(name="group_id", nullable=false)
    private GroupModel groupObj;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date started;



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

    public Date getStarted() {
        return started;
    }

    public void setStarted(Date started) {
        this.started = started;
    }


}
