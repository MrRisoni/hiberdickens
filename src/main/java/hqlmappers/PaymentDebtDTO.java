package hqlmappers;

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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getMonthTitle() {
        return monthTitle;
    }

    public void setMonthTitle(String monthTitle) {
        this.monthTitle = monthTitle;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public Long getEntityId() {
        return entityId;
    }

    public void setEntityId(Long entityId) {
        this.entityId = entityId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
