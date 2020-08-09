package models;

import javax.persistence.*;

@Entity
@Table(name = "discounts")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "discount_id")
    private Discount discModel;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "student_id")
    private Student studentObj;


    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "group_id")
    private GroupModel groupObj;

    public Discount() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Discount getDiscModel() {
        return discModel;
    }

    public void setDiscModel(Discount discModel) {
        this.discModel = discModel;
    }

    public Student getStudentObj() {
        return studentObj;
    }

    public void setStudentObj(Student studentObj) {
        this.studentObj = studentObj;
    }

    public GroupModel getGroupObj() {
        return groupObj;
    }

    public void setGroupObj(GroupModel groupObj) {
        this.groupObj = groupObj;
    }
}
