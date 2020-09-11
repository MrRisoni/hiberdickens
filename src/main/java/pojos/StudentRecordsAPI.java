package pojos;

import hqlmappers.StudentRecord;

import java.util.List;

public class StudentRecordsAPI extends RecordsAPI {

    private List<StudentRecord> students;

    public StudentRecordsAPI() {
    }

    public List<StudentRecord> getStudents() {
        return students;
    }

    public void setStudents(List<StudentRecord> students) {
        this.students = students;
    }
}
