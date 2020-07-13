package hqlmappers;

import java.util.Date;

public class ExamResultDTO {
    private Long resultId;
    private String courseTitle;
    private Date examDate;

    public ExamResultDTO(Long resultId, String courseTitle, Date examDate) {
        this.resultId = resultId;
        this.courseTitle = courseTitle;
        this.examDate = examDate;
    }

    public Long getResultId() {
        return resultId;
    }

    public void setResultId(Long resultId) {
        this.resultId = resultId;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }
}
