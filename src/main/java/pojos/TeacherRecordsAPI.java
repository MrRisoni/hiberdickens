package pojos;

import hqlmappers.TeacherRecord;

import java.util.List;

public class TeacherRecordsAPI extends RecordsAPI {

    private List<TeacherRecord> teachers;

    public TeacherRecordsAPI() {
    }

    public List<TeacherRecord> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<TeacherRecord> teachers) {
        this.teachers = teachers;
    }
}
