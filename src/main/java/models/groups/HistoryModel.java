package models.groups;

import lombok.Getter;
import lombok.Setter;
import models.general.Room;
import models.people.Teacher;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;

@Entity
@Table(name = "history")
@NamedEntityGraphs({
        @NamedEntityGraph(
                name = "historiesWithRooms",
                attributeNodes = {
                        @NamedAttributeNode("groupObj")
                }
        )
})

public class HistoryModel {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id", nullable = false)
    private GroupModel groupObj;

    @Getter
    @Setter
    @Column(name="starts_at")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date started;

    @Getter
    @Setter
    @Column(name="ends_at")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date ended;

    @Getter
    @Setter
    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @Getter
    @Setter
    @Column
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updated_at;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "room_id")
    private Room room;

    @Getter
    @Setter
    @Column
    private float duration;

    @Getter
    @Setter
    @Column
    private float wage;

    @Getter
    @Setter
    @Column
    private float fee;

    @Getter
    @Setter
    @Column
    private float vat;

    @Getter
    @Setter
    @Column
    private int cancelled;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "hour_id")
    private HourModel hour;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "teacher_id")
    private Teacher daskalos;

    public HistoryModel() {
    }

    public GroupModel getGroupObj() {
        return groupObj;
    }

    public void setGroupObj(GroupModel groupObj) {
        this.groupObj = groupObj;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }


    public HourModel getHour() {
        return hour;
    }

    public Teacher getDaskalos() {
        return daskalos;
    }

    public void setDaskalos(Teacher daskalos) {
        this.daskalos = daskalos;
    }
}