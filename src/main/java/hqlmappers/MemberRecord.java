package hqlmappers;

import lombok.Data;

import java.util.Date;

@Data
public class MemberRecord {
    public Long entityId;
    public String fullName;
    public Date registrationDate;

    public MemberRecord() {
    }

    public MemberRecord(Long entityId) {
        this.entityId = entityId;
    }
}
