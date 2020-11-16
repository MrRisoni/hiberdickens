package pojos;

import hqlmappers.StudentRecord;
import lombok.Data;
import java.util.List;

@Data
public class StudentRecordsAPI extends RecordsAPI {

    private List<StudentRecord> students;

    public StudentRecordsAPI() {
    }
}