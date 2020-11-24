package dtos;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class StudentResponseDto {
    private Date lastPayed;
    private String fullName;
    private BigDecimal totalPayed;
    private BigDecimal remainDebt;

}
