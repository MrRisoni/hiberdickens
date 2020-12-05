package dtos;

import lombok.Data;

@Data
public class DiplomaDto {
    private Long id;
    private String lvl;
    private CourseDto cours;
}
