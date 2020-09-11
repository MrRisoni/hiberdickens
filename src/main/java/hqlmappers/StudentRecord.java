package hqlmappers;

import java.math.BigDecimal;
import java.util.Date;

public class StudentRecord  extends MemberRecord{

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

    public Date getLastPayed() {
        return lastPayed;
    }

    public void setLastPayed(Date lastPayed) {
        this.lastPayed = lastPayed;
    }
}
