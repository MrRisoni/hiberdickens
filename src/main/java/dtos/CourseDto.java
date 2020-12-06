package dtos;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CourseDto {
    private Long id;
    private String title;
    private int active;
    private int numStudents;
    private int numTeachers;
    private int numGroups;
    private BigDecimal sumPayments;
    private int sumHours;
    private BigDecimal latestFee;
    private BigDecimal latestWage;
    private CourseTypeDto courseTypeObj;

    public CourseDto(Long id, String title) {
    }

    public CourseDto() {

    }
}
