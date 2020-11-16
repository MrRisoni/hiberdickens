package hqlmappers;

import lombok.Data;

import java.util.Date;

@Data
public class TimetableDTO {

    private Long historyId;
    private Long groupId;
    private Long hourId;

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

    public TimetableDTO(Long historyId, Long groupId, Long hourId, String courseName, String teacherName, String ageName, String speedName, Date started, float duration, String roomName, int cancelled, float wage, float fee) {
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

    public TimetableDTO(Long historyId, Date started, float duration, String roomName, int cancelled, float wage, float fee) {
        this.historyId = historyId;
        this.started = started;
        this.duration = duration;
        this.roomName = roomName;
        this.cancelled = cancelled;
        this.wage = wage;
        this.fee = fee;
    }
}