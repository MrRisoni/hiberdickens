package hqlmappers;

public class StudentPaymentDebt  extends PaymentDebt{
    private int studentId;
    private String fullName;

    public StudentPaymentDebt(float amount, String monthTitle, int year, int groupId, int studentId, String fullName) {
        super(amount, monthTitle, year, groupId);
        this.studentId = studentId;
        this.fullName = fullName;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
