package models;

import javax.persistence.*;

@Entity
@Table(name = "history_wages")
public class HistoryWages {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacher_id")
    private Teacher daskalos;

    @Column
    private float amount;

    public HistoryWages() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Teacher getDaskalos() {
        return daskalos;
    }

    public void setDaskalos(Teacher daskalos) {
        this.daskalos = daskalos;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
}
