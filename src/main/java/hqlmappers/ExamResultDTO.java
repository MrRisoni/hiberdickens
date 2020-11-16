package hqlmappers;

import lombok.Data;

import java.util.Date;

@Data
public class ExamResultDTO {
    private Long resultId;
    private String courseTitle;
    private Date examDate;

    public ExamResultDTO(Long resultId, String courseTitle, Date examDate) {
        this.resultId = resultId;
        this.courseTitle = courseTitle;
        this.examDate = examDate;
    }
}
