package dtos;

import lombok.Data;

import java.math.BigDecimal;

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

}
