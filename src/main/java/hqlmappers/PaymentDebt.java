package hqlmappers;

public class PaymentDebt {

    private float amount;
    private String monthTitle;
    private int year;
    private  int groupId;

    public PaymentDebt(float amount, String monthTitle, int year, int groupId) {
        this.amount = amount;
        this.monthTitle = monthTitle;
        this.year = year;
        this.groupId = groupId;
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
}
