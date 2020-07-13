package hqlmappers;

import java.util.Date;

public class ExamResultNumberDTO extends ExamResultDTO {
    private float gradeNum;

    public ExamResultNumberDTO(Long resultId, String courseTitle, Date examDate, float gradeNum) {
        super(resultId, courseTitle, examDate);
        this.gradeNum = gradeNum;
    }

    public float getGradeNUm() {
        return gradeNum;
    }

    public void setGradeNUm(float gradeNum) {
        this.gradeNum = gradeNum;
    }
}
