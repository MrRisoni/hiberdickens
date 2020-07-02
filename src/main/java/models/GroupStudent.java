package models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "group_students")
public class GroupStudent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date joined;


    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date dropped;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id")
    private Student studentObj;

    @Column(name = "group_id")
    private int groupId;


    public GroupStudent() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getJoined() {
        return joined;
    }

    public void setJoined(Date joined) {
        this.joined = joined;
    }

    public Date getDropped() {
        return dropped;
    }

    public void setDropped(Date dropped) {
        this.dropped = dropped;
    }


    public Student getStudentObj() {
        return studentObj;
    }

    public void setStudentObj(Student studentObj) {
        this.studentObj = studentObj;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }
}
