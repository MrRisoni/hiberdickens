package models;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "teachers")
public class Teacher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @OneToOne
    @JoinColumn(name = "member_id")
    private Member member;


    @OneToMany(mappedBy = "daskalos", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JsonIgnore
    private List<GroupModel> grouppen = new ArrayList<>();


    public Teacher() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public List<GroupModel> getGrouppen() {
        return grouppen;
    }

    public void setGrouppen(List<GroupModel> grouppen) {
        this.grouppen = grouppen;
    }
}
