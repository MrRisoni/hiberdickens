package models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "payroll")
public class PayRoll {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private  float gross;

    @Column
    private  float insurances;


    @Column
    private  float total_hours;

    @Column
    private  float net;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date fiscal_year;

    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date created_at;

    @OneToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacherObj;

    @OneToOne
    @JoinColumn(name = "month_id")
    private Month monthObj;

    @OneToMany(mappedBy = "payrollObj", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    @JsonIgnoreProperties("payrollObj")
    private List<PayRollAnalysis> analysis = new ArrayList<PayRollAnalysis>();

    public PayRoll() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public float getGross() {
        return gross;
    }

    public void setGross(float gross) {
        this.gross = gross;
    }

    public float getInsurances() {
        return insurances;
    }

    public void setInsurances(float insurances) {
        this.insurances = insurances;
    }

    public float getTotal_hours() {
        return total_hours;
    }

    public void setTotal_hours(float total_hours) {
        this.total_hours = total_hours;
    }

    public float getNet() {
        return net;
    }

    public void setNet(float net) {
        this.net = net;
    }

    public Date getFiscal_year() {
        return fiscal_year;
    }

    public void setFiscal_year(Date fiscal_year) {
        this.fiscal_year = fiscal_year;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Teacher getTeacherObj() {
        return teacherObj;
    }

    public void setTeacherObj(Teacher teacherObj) {
        this.teacherObj = teacherObj;
    }

    public Month getMonthObj() {
        return monthObj;
    }

    public void setMonthObj(Month monthObj) {
        this.monthObj = monthObj;
    }

    public List<PayRollAnalysis> getAnalysis() {
        return analysis;
    }

    public void setAnalysis(List<PayRollAnalysis> analysis) {
        this.analysis = analysis;
    }
}
