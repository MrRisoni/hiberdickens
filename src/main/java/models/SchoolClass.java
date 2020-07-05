package models;

import javax.persistence.*;

@Entity
@Table(name = "school_classes")
public class SchoolClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String title;

    @Column(name = "show_order")
    private int shownOrder;

    public SchoolClass() {
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

    public int getShownOrder() {
        return shownOrder;
    }

    public void setShownOrder(int shownOrder) {
        this.shownOrder = shownOrder;
    }
}
