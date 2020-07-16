package models;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "students")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<StudentDebt> debtsList = new ArrayList<StudentDebt>();

    @OneToMany(mappedBy = "studentObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<Absency> absenciesList = new ArrayList<Absency>();


    public Student() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public List<StudentDebt> getDebtsList() {
        return debtsList;
    }

    public void setDebtsList(List<StudentDebt> debtsList) {
        this.debtsList = debtsList;
    }

    public List<Absency> getAbsenciesList() {
        return absenciesList;
    }

    public void setAbsenciesList(List<Absency> absenciesList) {
        this.absenciesList = absenciesList;
    }
}
