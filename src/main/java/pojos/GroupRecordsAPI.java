package pojos;

import hqlmappers.GroupRecord;

import java.util.List;

public class GroupRecordsAPI extends RecordsAPI {
    private List<GroupRecord> groups;

    public GroupRecordsAPI() {
    }

    public List<GroupRecord> getGroups() {
        return groups;
    }

    public void setGroups(List<GroupRecord> groups) {
        this.groups = groups;
    }
}
