package hqlmappers;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class ExamResultTextDTO extends ExamResultDTO {
    @Getter
    @Setter
    private String gradeText;

    public ExamResultTextDTO(Long resultId, String courseTitle, Date examDate, String gradeText) {
        super(resultId, courseTitle, examDate);
        this.gradeText = gradeText;
    }
}