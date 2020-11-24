package hqlmappers;

import lombok.Data;

@Data
public class GroupMemberDto {

    private int studentId;
    private String joined;
    private String dropped;
    private String fullName;
    private boolean hasDropped;
    private float sumPayed;
    private float sumOwns;

    public GroupMemberDto() {
        this.hasDropped = false;
        this.sumOwns = this.sumPayed = 0;
    }
}