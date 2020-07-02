package repositories;

import java.util.Date;

public class GroupMember {

    private int studentId;
    private java.util.Date joined;
    private java.util.Date dropped;
    private String fullName;

    public GroupMember(Date joined, Date dropped, String fullName) {
        this.joined = joined;
        this.dropped = dropped;
        this.fullName = fullName;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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
}
