package models.school;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Entity
@Table(name = "school_classes")
public class SchoolClass {
    @Getter
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Getter
    @Setter
    @Column
    private String title;

    @Getter
    @Setter
    @Column(name = "show_order")
    private int shownOrder;

    public SchoolClass() {
    }
}