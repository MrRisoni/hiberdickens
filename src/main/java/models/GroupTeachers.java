package models;

import javax.persistence.*;

@Entity
@Table(name = "groups_teachers")
public class GroupTeachers {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "teacher_id")
    private Teacher teacherObj;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "group_id")
    private GroupModel groupObj;

    public GroupTeachers() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Teacher getTeacherObj() {
        return teacherObj;
    }

    public void setTeacherObj(Teacher teacherObj) {
        this.teacherObj = teacherObj;
    }

    public GroupModel getGroupObj() {
        return groupObj;
    }

    public void setGroupObj(GroupModel groupObj) {
        this.groupObj = groupObj;
    }
}
