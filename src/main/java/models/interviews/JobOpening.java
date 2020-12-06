package models.interviews;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "job_openings")
public class JobOpening {
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

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JoinColumn(name = "opening_id")
    private List<JobOpeningCourse> forCourses = new ArrayList<JobOpeningCourse>();

    public JobOpening() {
    }

    public List<JobOpeningCourse> getForCourses() {
        return forCourses;
    }

    public void setForCourses(List<JobOpeningCourse> forCourses) {
        this.forCourses = forCourses;
    }
}
