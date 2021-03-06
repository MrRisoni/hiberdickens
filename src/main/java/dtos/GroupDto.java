package dtos;

import hqlmappers.GroupMemberDto;
import hqlmappers.PaymentDebtDTO;
import hqlmappers.TimetableDTO;
import lombok.Data;
import models.groups.GroupStudent;

import java.math.BigDecimal;
import java.util.List;

@Data
public class GroupDto {
    private Long id;
    private String title;

    private int active;
    private java.util.Date updated_at;
    private int max_seats;
    private int remaining_seats;
    private BigDecimal studentsNum;
    private BigDecimal paymentsSumStudents;
    private BigDecimal paymentsSumTeachers;
    private BigDecimal debtsSumStudents;

    private BigDecimal debtsSumTeachers;
    private BigDecimal remainingStudentDebt;
    private BigDecimal remainingTeacherDebt;
    private BigDecimal sumHours;
    private java.util.Date ends_at;

    private CourseFeeDto feeObj;
    private CourseWageDto wageObj;
    private RankDto rankObj;
    private SpeedDto speedObj;
    private AgeDto ageObj;
    private CourseDto courseObj;
    private List<TimetableDTO> history;
    private List<GroupStudent> studentsCollection;
    private int totalMembers;
    private List<PaymentDebtDTO> studentsDebtsList;
    private List<PaymentDebtDTO> studentsPaymentsList;
    private List<PaymentDebtDTO> teachersDebtsList;
    private List<PaymentDebtDTO> teachersPaymentsList;
}
