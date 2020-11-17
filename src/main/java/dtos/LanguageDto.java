package dtos;

import lombok.Data;

import java.util.List;

@Data
public class LanguageDto {
    private Long id;
    private String title;
    private int active;
    private List<DiplomaDto> diplomas ;
    private Long numSpeakers;
}
