package models.interviews;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import models.groups.CourseModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "pools")
public class Pools {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;


    @Column
    private String title;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "course_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) // myster
    private CourseModel courseObj;


    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinColumn(name = "pool_id")
    private List<PoolChapter> poolChaptersList = new ArrayList<PoolChapter>();

    public Pools() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CourseModel getCourseObj() {
        return courseObj;
    }

    public void setCourseObj(CourseModel courseObj) {
        this.courseObj = courseObj;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public List<PoolChapter> getPoolChaptersList() {
        return poolChaptersList;
    }

    public void setPoolChaptersList(List<PoolChapter> poolChaptersList) {
        this.poolChaptersList = poolChaptersList;
    }
}
