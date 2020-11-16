package hqlmappers;

import lombok.Data;

@Data
public class PaymentDebtDTO {
    private String fullName;
    private float amount;
    private String monthTitle;
    private int year;
    private Long groupId;
    private Long entityId;
    private String courseName;

    public PaymentDebtDTO(float amount, String monthTitle, int year, Long groupId, Long entityId, String fullName, String courseName) {
        this.fullName = fullName;
        this.amount = amount;
        this.monthTitle = monthTitle;
        this.year = year;
        this.groupId = groupId;
        this.entityId = entityId;
        this.courseName = courseName;
    }
}