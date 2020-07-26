package models;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

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
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="group_id", nullable=false)
    @JsonIgnoreProperties("historyList")
    private GroupModel groupObj;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date started;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date ended;

    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @Column
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updated_at;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "room_id")
    private Room room;

    @Column
    private float duration;

    @Column
    private float wage;

    @Column
    private float fee;

    @Column
    private float vat;

    @Column
    private int cancelled;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "hour_id")
    private HourModel hour;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "teacher_id")
    private Teacher daskalos;

    public HistoryModel() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }


    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }


    public HourModel getHour() {
        return hour;
    }

    public void setHour(HourModel hour) {
        this.hour = hour;
    }

    public float getFee() {
        return fee;
    }

    public void setFee(float fee) {
        this.fee = fee;
    }

    public float getVat() {
        return vat;
    }

    public void setVat(float vat) {
        this.vat = vat;
    }

    public int getCancelled() {
        return cancelled;
    }

    public void setCancelled(int cancelled) {
        this.cancelled = cancelled;
    }

    public Date getEnded() {
        return ended;
    }

    public void setEnded(Date ended) {
        this.ended = ended;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public Teacher getDaskalos() {
        return daskalos;
    }

    public void setDaskalos(Teacher daskalos) {
        this.daskalos = daskalos;
    }

    public float getWage() {
        return wage;
    }

    public void setWage(float wage) {
        this.wage = wage;
    }
}
