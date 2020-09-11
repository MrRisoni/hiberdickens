package hqlmappers;

public class GroupMember {

    private int studentId;
    private String joined;
    private String dropped;
    private String fullName;
    private boolean hasDropped;
    private float sumPayed;
    private  float sumOwns;

    public GroupMember() {
        this.hasDropped = false;
        this.sumOwns = this.sumPayed = 0;
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

    public String getJoined() {
        return joined;
    }

    public void setJoined(String joined) {
        this.joined = joined;
    }

    public String getDropped() {
        return dropped;
    }

    public void setDropped(String dropped) {
        this.dropped = dropped;
    }

    public boolean isHasDropped() {
        return hasDropped;
    }

    public void setHasDropped(boolean hasDropped) {
        this.hasDropped = hasDropped;
    }

    public float getSumPayed() {
        return sumPayed;
    }

    public void setSumPayed(float sumPayed) {
        this.sumPayed = sumPayed;
    }

    public float getSumOwns() {
        return sumOwns;
    }

    public void setSumOwns(float sumOwns) {
        this.sumOwns = sumOwns;
    }
}
