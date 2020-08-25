package models.money;

import models.groups.GroupModel;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "payroll_groups_analysis")
public class PayRollGroupAnalysis {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date from_day;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date to_day;

    @Column
    private float hourly_rate;

    @Column
    private float amount;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "group_id")
    private GroupModel groupObj;

    public PayRollGroupAnalysis() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFrom_day() {
        return from_day;
    }

    public void setFrom_day(Date from_day) {
        this.from_day = from_day;
    }

    public Date getTo_day() {
        return to_day;
    }

    public void setTo_day(Date to_day) {
        this.to_day = to_day;
    }

    public float getHourly_rate() {
        return hourly_rate;
    }

    public void setHourly_rate(float hourly_rate) {
        this.hourly_rate = hourly_rate;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public GroupModel getGroupObj() {
        return groupObj;
    }

    public void setGroupObj(GroupModel groupObj) {
        this.groupObj = groupObj;
    }
}
