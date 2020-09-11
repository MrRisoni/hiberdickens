package models.seminars;

import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "seminar_modules")
public class SeminarModules {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @NotNull
    @Column
    private String title;

    @Column
    private int active;

    @Column
    private int part_time;

    @Column
    private int on_site;

    @Column
    private float cost;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date starts;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date ends;

    @Column
    private int max_seats;

    @Column
    private int total_hours;

    @Column
    private float cost_per_hour;

    @Formula("(SELECT COUNT(semt.teacher_id) FROM seminar_teachers semt WHERE semt.module_id = id)")
    private int numTeachers;

    @Formula("(SELECT COUNT(semg.group_id) FROM seminar_groups semg WHERE semg.module_id = id)")
    private int numGroups;


    public SeminarModules() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getPart_time() {
        return part_time;
    }

    public void setPart_time(int part_time) {
        this.part_time = part_time;
    }

    public int getOn_site() {
        return on_site;
    }

    public void setOn_site(int on_site) {
        this.on_site = on_site;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public Date getStarts() {
        return starts;
    }

    public void setStarts(Date starts) {
        this.starts = starts;
    }

    public Date getEnds() {
        return ends;
    }

    public void setEnds(Date ends) {
        this.ends = ends;
    }

    public int getMax_seats() {
        return max_seats;
    }

    public void setMax_seats(int max_seats) {
        this.max_seats = max_seats;
    }

    public int getTotal_hours() {
        return total_hours;
    }

    public void setTotal_hours(int total_hours) {
        this.total_hours = total_hours;
    }

    public float getCost_per_hour() {
        return cost_per_hour;
    }

    public void setCost_per_hour(float cost_per_hour) {
        this.cost_per_hour = cost_per_hour;
    }

    public int getNumTeachers() {
        return numTeachers;
    }

    public int getNumGroups() {
        return numGroups;
    }
}
