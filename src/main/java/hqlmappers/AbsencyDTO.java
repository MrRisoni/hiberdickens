package hqlmappers;

import java.util.Date;

public class AbsencyDTO {
    private  Long historyId;
    private java.util.Date started;
    private String courseTitle;
    private int justified;


    public AbsencyDTO(Long historyId, Date started, String courseTitle, int justified) {
        this.historyId = historyId;
        this.started = started;
        this.courseTitle = courseTitle;
        this.justified = justified;
    }

    public Long getHistoryId() {
        return historyId;
    }

    public void setHistoryId(Long historyId) {
        this.historyId = historyId;
    }

    public Date getStarted() {
        return started;
    }

    public void setStarted(Date started) {
        this.started = started;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public int getJustified() {
        return justified;
    }

    public void setJustified(int justified) {
        this.justified = justified;
    }
}
