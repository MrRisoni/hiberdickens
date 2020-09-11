package hqlmappers;

import java.util.Date;

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
