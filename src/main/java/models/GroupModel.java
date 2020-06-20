package models;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "groupakia")
@NamedEntityGraphs({
        @NamedEntityGraph(
                name = "groupsWithTeachers",
                attributeNodes = {
                        @NamedAttributeNode("daskalos")
                }
        ),
        @NamedEntityGraph(
                name = "groupsWithHistories",
                attributeNodes = {
                        @NamedAttributeNode("historyList")
                }
        )
})
public class GroupModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @Column
    private String title;


    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<HistoryModel> historyList = new ArrayList<HistoryModel>();

    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<MockExam> mockExams = new ArrayList<MockExam>();

    @OneToOne
    @JoinColumn(name = "teacher_id")
    private Teacher daskalos;


    @OneToMany( cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<StudentDebt> studentsDebt = new ArrayList<StudentDebt>();


    @OneToMany( cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private List<GroupStudent> studentsList = new ArrayList<GroupStudent>();



    public GroupModel() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<HistoryModel> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<HistoryModel> historyList) {
        this.historyList = historyList;
    }

    public Teacher getDaskalos() {
        return daskalos;
    }

    public void setDaskalos(Teacher daskalos) {
        this.daskalos = daskalos;
    }

    public List<MockExam> getMockExams() {
        return mockExams;
    }

    public void setMockExams(List<MockExam> mockExams) {
        this.mockExams = mockExams;
    }

    public List<StudentDebt> getStudentsDebt() {
        return studentsDebt;
    }

    public void setStudentsDebt(List<StudentDebt> studentsDebt) {
        this.studentsDebt = studentsDebt;
    }

    public List<GroupStudent> getStudentsList() {
        return studentsList;
    }

    public void setStudentsList(List<GroupStudent> studentsList) {
        this.studentsList = studentsList;
    }
}
