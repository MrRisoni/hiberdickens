package dtos;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class GroupStudentDto {
    private Long student_id;
    private Date joined;
    private String fullName;
    private int hasDropped;
    private String lastPayed;
    private BigDecimal hasPayed;
    private BigDecimal remainingDebt;
    private Date updated_at;
}
