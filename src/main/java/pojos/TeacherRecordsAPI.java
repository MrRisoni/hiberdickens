package pojos;

import hqlmappers.TeacherRecord;
import lombok.Data;

import java.util.List;

@Data
public class TeacherRecordsAPI extends RecordsAPI {

    private List<TeacherRecord> teachers;

    public TeacherRecordsAPI() {
    }
}