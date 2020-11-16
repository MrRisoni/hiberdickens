package pojos;

import hqlmappers.GroupRecord;
import lombok.Data;
import java.util.List;

@Data
public class GroupRecordsAPI extends RecordsAPI {
    private List<GroupRecord> groups;

    public GroupRecordsAPI() {
    }
}