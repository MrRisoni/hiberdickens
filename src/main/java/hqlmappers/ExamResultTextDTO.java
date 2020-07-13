package hqlmappers;

import java.util.Date;

public class ExamResultTextDTO extends ExamResultDTO {
    private String gradeText;

    public ExamResultTextDTO(Long resultId, String courseTitle, Date examDate, String gradeText) {
        super(resultId, courseTitle, examDate);
        this.gradeText = gradeText;
    }

    public String getGradeText() {
        return gradeText;
    }

    public void setGradeText(String gradeText) {
        this.gradeText = gradeText;
    }
}
