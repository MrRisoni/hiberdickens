package models;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "groupakia")
public class GroupModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @Column
    private String title;


    @OneToMany(mappedBy = "groupObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JsonBackReference
    private Set<HistoryModel> historyList ;

    @ManyToOne(fetch = FetchType.LAZY )
    @JsonManagedReference
    @JoinColumn(name="teacher_id", nullable=false)
    private Teacher daskalos;

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

    public Set<HistoryModel> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(Set<HistoryModel> historyList) {
        this.historyList = historyList;
    }

    public Teacher getDaskalos() {
        return daskalos;
    }

    public void setDaskalos(Teacher daskalos) {
        this.daskalos = daskalos;
    }
}
