package pojos;

import hqlmappers.StudentRecord;
import models.Student;
import org.springframework.data.domain.Page;

import java.util.List;

public class StudentRecordsAPI {
    private int totalPages;
    private int currentPage;
    private Long totalRecords;
    private List<StudentRecord> students;

    public StudentRecordsAPI() {
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public Long getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Long totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<StudentRecord> getStudents() {
        return students;
    }

    public void setStudents(List<StudentRecord> students) {
        this.students = students;
    }
}
