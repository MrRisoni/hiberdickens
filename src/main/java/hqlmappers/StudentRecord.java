package hqlmappers;

import lombok.Data;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class StudentRecord  extends MemberRecord {

    private int numGroups;
    private BigDecimal payments;
    private BigDecimal debt;
    private Date lastPayed;

    public StudentRecord() {
    }

    public StudentRecord(Long studentId) {
        this.entityId = studentId;
    }

    public StudentRecord(Long studentId, String fullName, Date registrationDate, int numGroups, BigDecimal payments, BigDecimal debt, Date lastPayed) {
        this.entityId = studentId;
        this.fullName = fullName;
        this.registrationDate = registrationDate;
        this.numGroups = numGroups;
        this.payments = payments;
        this.debt = debt;
        this.lastPayed = lastPayed;
    }
}