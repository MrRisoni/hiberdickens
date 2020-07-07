package hqlmappers;

public class PaymentDebtDTO {
    private String fullName;
    private float amount;
    private String monthTitle;
    private int year;
    private int groupId;
    private int entityId;
    private String courseName;

   public PaymentDebtDTO(float amount, String monthTitle, int year, int groupId, int entityId, String fullName, String courseName) {
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

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getEntityId() {
        return entityId;
    }

    public void setEntityId(int entityId) {
        this.entityId = entityId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
