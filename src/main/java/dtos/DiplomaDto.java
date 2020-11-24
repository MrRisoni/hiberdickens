package dtos;

import lombok.Data;

@Data
public class DiplomaDto {
    private Long id;
    private String level;
    private CourseDto cours;
}
