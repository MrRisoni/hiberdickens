package hqlmappers;

import lombok.Data;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class StudentGroupDTO {

    private Long groupId;
    private String courseName;
    private String ageName;
    private String speedName;

    private Date joined;
    private Date dropped;

    private BigDecimal totalPayed;
    private BigDecimal totalDebt;

    public StudentGroupDTO(Long groupId, String courseName, String ageName, String speedName, Date joined, Date dropped, BigDecimal ttlp,BigDecimal ttldbt) {
        this.groupId = groupId;
        this.courseName = courseName;
        this.ageName = ageName;
        this.speedName = speedName;
        this.joined = joined;
        this.dropped = dropped;
        this.totalPayed = ttlp;
        this.totalDebt = ttldbt;
    }
}