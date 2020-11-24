package dtos;

import lombok.Data;

import java.util.Collection;

@Data
public class TimetableResponseDto {
    private Collection<String> days;
    private Collection<BuildingDto> buildings;
    private Collection<LanguageDto> languages;
    private Collection<SpeedDto> speeds;
    private Collection<AgeDto> ages;
    private Collection<DisciplineDto> disciplines;
    private Collection<CourseTypeDto> courseTypes;
    private Collection<SchoolClassDto> schoolClasses;
    private Collection<Object> timetabling;
}
