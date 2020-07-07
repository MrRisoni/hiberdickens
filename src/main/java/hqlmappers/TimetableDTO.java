package hqlmappers;

import java.util.Date;

public class TimetableDTO {

    private int historyId;
    private int groupId;
    private int hourId;

    private String courseName;
    private String teacherName;
    private String ageName;
    private String speedName;
    private java.util.Date started;
    private float duration;
    private String roomName;
    private int cancelled;
    private float wage;
    private float fee;

    public TimetableDTO(int historyId, int groupId, int hourId, String courseName, String teacherName, String ageName, String speedName, Date started, float duration, String roomName, int cancelled, float wage, float fee) {
        this.historyId = historyId;
        this.groupId = groupId;
        this.hourId = hourId;
        this.courseName = courseName;
        this.teacherName = teacherName;
        this.ageName = ageName;
        this.speedName = speedName;
        this.started = started;
        this.duration = duration;
        this.roomName = roomName;
        this.cancelled = cancelled;
        this.wage = wage;
        this.fee = fee;
    }

    public TimetableDTO(int historyId, Date started, float duration, String roomName, int cancelled, float wage, float fee) {
        this.historyId = historyId;
        this.started = started;
        this.duration = duration;
        this.roomName = roomName;
        this.cancelled = cancelled;
        this.wage = wage;
        this.fee = fee;
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

    public int getCancelled() {
        return cancelled;
    }

    public void setCancelled(int cancelled) {
        this.cancelled = cancelled;
    }

    public float getWage() {
        return wage;
    }

    public void setWage(float wage) {
        this.wage = wage;
    }

    public float getFee() {
        return fee;
    }

    public void setFee(float fee) {
        this.fee = fee;
    }

    public int getHourId() {
        return hourId;
    }

    public void setHourId(int hourId) {
        this.hourId = hourId;
    }
}
