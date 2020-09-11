package hqlmappers;

import java.math.BigDecimal;
import java.util.Date;

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


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public int getNumGroups() {
        return numGroups;
    }

    public void setNumGroups(int numGroups) {
        this.numGroups = numGroups;
    }

    public BigDecimal getPayments() {
        return payments;
    }

    public void setPayments(BigDecimal payments) {
        this.payments = payments;
    }

    public BigDecimal getDebt() {
        return debt;
    }

    public void setDebt(BigDecimal debt) {
        this.debt = debt;
    }
}
