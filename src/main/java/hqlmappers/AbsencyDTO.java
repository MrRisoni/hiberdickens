package hqlmappers;

import lombok.Data;

import java.util.Date;

@Data
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
}
