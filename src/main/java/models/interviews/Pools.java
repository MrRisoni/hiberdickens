package models.interviews;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import models.groups.CourseModel;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "pools")
public class Pools {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Getter
    @Setter
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

    public CourseModel getCourseObj() {
        return courseObj;
    }

    public void setCourseObj(CourseModel courseObj) {
        this.courseObj = courseObj;
    }

    public List<PoolChapter> getPoolChaptersList() {
        return poolChaptersList;
    }

    public void setPoolChaptersList(List<PoolChapter> poolChaptersList) {
        this.poolChaptersList = poolChaptersList;
    }
}
