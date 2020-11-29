package dtos;

import hqlmappers.AbsencyDTO;
import hqlmappers.StudentGroupDTO;
import hqlmappers.TimetableDTO;
import lombok.Data;
import models.money.StudentDebt;
import models.money.StudentPayment;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class StudentResponseDto {
    private Date lastPayed;
    private String fullName;
    private BigDecimal totalPayed;
    private BigDecimal remainDebt;
    private List<AbsencyDTO> abscencies;
    private List<StudentPayment> payments;
    private List<StudentDebt> debts;
    private List<StudentGroupDTO> groups;
    private List<TimetableDTO> timetable;
}
