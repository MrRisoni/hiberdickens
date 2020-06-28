package records;

import java.util.Date;

public class TimetableRcd {

    private int historyId;
    private int groupId;
    private String courseName;
    private String teacherName;
    private java.util.Date started;
    private float duration;
    private String roomName;

    public TimetableRcd(int historyId, int groupId, String courseName,  Date started, float duration, String roomName) {
        this.historyId = historyId;
        this.groupId = groupId;
        this.courseName = courseName;
        this.started = started;
        this.duration = duration;
        this.roomName = roomName;
    }

    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Date getStarted() {
        return started;
    }

    public void setStarted(Date started) {
        this.started = started;
    }

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
}
