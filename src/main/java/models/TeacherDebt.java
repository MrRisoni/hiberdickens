package models;

import javax.persistence.*;

@Entity
@Table(name = "teacher_debts")
public class TeacherDebt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    public TeacherDebt() {
    }
}
