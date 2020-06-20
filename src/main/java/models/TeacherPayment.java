package models;


import javax.persistence.*;

@Entity
@Table(name = "teacher_payments")
public class TeacherPayment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    public TeacherPayment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
