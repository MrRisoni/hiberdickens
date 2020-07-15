package models;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "members")
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private String name;

    @Column
    private String surname;

    @Column
    private String phone;

    @Column
    private String email;

    @Column
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date created_at;

    @Column
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updated_at;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "suburb_id")
    private Suburb suburbObj;


    public Member() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Suburb getSuburbObj() {
        return suburbObj;
    }

    public void setSuburbObj(Suburb suburbObj) {
        this.suburbObj = suburbObj;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }
}
