package hqlmappers;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class TeacherRecord extends MemberRecord {

    private int numGroups;
    private BigDecimal payments;
    private BigDecimal debt;

    public TeacherRecord() {
    }

    public TeacherRecord(Long teacherId) {
        this.entityId = teacherId;
    }

    public TeacherRecord(Long teacherId, String fullName, Date registrationDate, int numGroups, BigDecimal payments, BigDecimal debt) {
        this.entityId = teacherId;
        this.fullName = fullName;
        this.registrationDate = registrationDate;
        this.numGroups = numGroups;
        this.payments = payments;
        this.debt = debt;
    }
}