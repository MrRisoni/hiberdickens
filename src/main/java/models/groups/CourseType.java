package models.groups;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;
import models.JackSonViewer;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;


@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "course_type")
public class CourseType {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    @JsonView(JackSonViewer.ICourse.class)
    private Long id;

    @Getter
    @Setter
    @Column
    @JsonView(JackSonViewer.ICourse.class)
    private String title;

    public CourseType() {
    }
}