package pojos;

import hqlmappers.StudentRecord;

import java.util.List;

public class StudentRecordsAPI {
    private int totalPages;
    private int currentPage;
    private int totalRecords;
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

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<StudentRecord> getStudents() {
        return students;
    }

    public void setStudents(List<StudentRecord> students) {
        this.students = students;
    }
}
