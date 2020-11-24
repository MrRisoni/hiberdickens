package hqlmappers;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class ExamResultNumberDTO extends ExamResultDTO {
    @Getter
    @Setter
    private float gradeNum;

    public ExamResultNumberDTO(Long resultId, String courseTitle, Date examDate, float gradeNum) {
        super(resultId, courseTitle, examDate);
        this.gradeNum = gradeNum;
    }
}