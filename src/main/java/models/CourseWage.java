package models;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "course_wages")
public class CourseWage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private BigDecimal amount;

    public CourseWage() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
}
