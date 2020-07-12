package hqlmappers;

import java.util.Date;

public class StudentGroupDTO {

    private  Long groupId;
    private String courseName;
    private String ageName;
    private String speedName;

    private Date joined;
    private Date dropped;

    public StudentGroupDTO(Long groupId, String courseName, String ageName, String speedName, Date joined, Date dropped) {
        this.groupId = groupId;
        this.courseName = courseName;
        this.ageName = ageName;
        this.speedName = speedName;
        this.joined = joined;
        this.dropped = dropped;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getAgeName() {
        return ageName;
    }

    public void setAgeName(String ageName) {
        this.ageName = ageName;
    }

    public String getSpeedName() {
        return speedName;
    }

    public void setSpeedName(String speedName) {
        this.speedName = speedName;
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
