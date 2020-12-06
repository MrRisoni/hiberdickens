package dtos;

import lombok.Data;
import models.money.TeacherPayment;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
public class TeacherResponseDto {
    Long teacherId;
    Long memberId;
    String fullName;
    BigDecimal remainingDebt;
    Date calculatedAt;
    Date created_at;
    List<CourseDto> courses;
    List<TeacherPayment> payments;
    List<TeacherPayment> debts;
    ArrayList<Object> finalTimeTabling;
    List<String> days;
}
