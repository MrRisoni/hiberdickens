package models;

import javax.persistence.*;

@Entity
@Table(name = "student_payed")
public class StudentPayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    public StudentPayment() {
    }
}
