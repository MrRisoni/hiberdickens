package controllers;

import dtos.*;
import logic.MiniHour;
import models.*;
import models.groups.Age;
import models.groups.CourseType;
import models.groups.HourModel;
import models.groups.Speed;
import models.school.Discipline;
import models.school.SchoolClass;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import hqlmappers.TimetableDTO;
import repositories.GeneralRepository;
import spring_repos.*;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class TimetableController {

    @Autowired
    private LanguageRepository lgrepo;

    @Autowired
    private AgeRepository agrp;

    @Autowired
    private SpeedRepository spdRp;

    @Autowired
    private CourseTypeRepository typeRsp;

    @Autowired
    private DisciplineRepository dscplRepo;

    @Autowired
    ModelMapper modelMapper;

    @Value("${app.beginning}")
    private String startingDate;


    @RequestMapping(value = "/api/timetable", method = RequestMethod.GET)
    public TimetableResponseDto istoria()
    {
        try {
            EntityManager entityManager= HibernateUtil.getEM();
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

            TimetableResponseDto timetableresponsedto = new TimetableResponseDto();

            List<TimetableDTO> timetable = entityManager.createQuery("SELECT new hqlmappers.TimetableDTO(hs.id, gr.id,hr.id, crs.title,mb.name, ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                    " FROM HistoryModel hs  JOIN hs.room rm " +
                    " JOIN hs.groupObj gr " +
                    " JOIN hs.hour hr " +
                    " JOIN gr.speedObj spd " +
                    " JOIN gr.ageObj ag " +
                    " JOIN hs.daskalos dsk JOIN dsk.member mb " +
                    " JOIN gr.courseObj crs  ORDER  BY hs.started ASC"
                   , TimetableDTO.class)
                    .setHint("org.hibernate.cacheable", true)
                    .getResultList();

            List<String> days = new ArrayList<>();

            days = timetable.stream().map(el -> {
                try {
                    return formatter.format(el.getStarted()).toString();

                } catch (Exception ex) {
                    return "";
                }
            }).collect(Collectors.toList());

            days = days.stream().distinct().collect(Collectors.toList());
            days.add("#");
            days.add(0, "#");
            timetableresponsedto.setDays(days);


            GeneralRepository gRepo = new GeneralRepository();
            gRepo.setEntityManager(entityManager);
            List<HourModel> hoursList = gRepo.getHours();
    
            ArrayList<MiniHour> hourRanges = new ArrayList<>();
    
            for (int i = 0; i < hoursList.size() - 1; i++) {
                int startin = Integer.parseInt(hoursList.get(i).getTitle().substring(0, 2)) * 60 + Integer.parseInt(hoursList.get(i).getTitle().substring(2));
                int endin = Integer.parseInt(hoursList.get(i + 1).getTitle().substring(0, 2)) * 60 + Integer.parseInt(hoursList.get(i + 1).getTitle().substring(2));
    
                String aus_von = hoursList.get(i).getTitle() + "-" + hoursList.get(i + 1).getTitle();
    
                hourRanges.add(new MiniHour(startin, endin, aus_von));
            }
    
            ArrayList<Object> finalTimeTabling = new ArrayList<>(); // preservers order of insertion
    
            for (int h = 0; h < hourRanges.size(); h++) {
                //System.out.println(hourRanges.get(h).getTitle());
                ArrayList<String> thisHour = new ArrayList<>();
    
                thisHour.add(hourRanges.get(h).getTitle());
    
                for (int d = 1; d < days.size() - 1; d++) { // skip #
                    ArrayList<String> matchedActivities = new ArrayList<>();
    
                    for (TimetableDTO actObj : timetable) {
                        String niceDayFormat = formatter.format(actObj.getStarted()).toString();
                        String niceHourFormat = hourFormatter.format(actObj.getStarted()).toString();
                        int uhr = Integer.parseInt(niceHourFormat.substring(0, 2));
                        int minutes = Integer.parseInt(niceHourFormat.substring(3));
    
                        int localStarting = uhr * 60 + minutes;
                        int localEnding = localStarting + 90;
    
                        if (niceDayFormat.equals(days.get(d))) {
                            if (localStarting <= hourRanges.get(h).getStartin()) {
                                if (localEnding >= hourRanges.get(h).getEnding()) {
                                    matchedActivities.add(actObj.getCourseName());
                                }
                            }
                        }
    
                    } // end for timetable
                    thisHour.add(String.join(",", matchedActivities));
    
                } // end for days
    
                thisHour.add(hourRanges.get(h).getTitle());
                finalTimeTabling.add(thisHour);
            } // end for hours

            timetableresponsedto.setTimetabling( finalTimeTabling);

            GeneralRepository genRepo = new GeneralRepository();
            genRepo.setEntityManager(HibernateUtil.getEM());

            ArrayList<SchoolClassDto> schoolClasses = new ArrayList<>();
            genRepo.getClasses().stream().forEach(schoolClassEntity -> {
                SchoolClassDto schuleKlassDto = modelMapper.map(schoolClassEntity,SchoolClassDto.class);
                schoolClasses.add(schuleKlassDto);
            });
            timetableresponsedto.setSchoolClasses(schoolClasses);

            ArrayList<CourseTypeDto> courseTypeDtos = new ArrayList<CourseTypeDto>();
            for (CourseType courseTypeEntity : typeRsp.findAll()) {
                CourseTypeDto crsTypDto = modelMapper.map(courseTypeEntity,CourseTypeDto.class);
                courseTypeDtos.add(crsTypDto);
            }
            timetableresponsedto.setCourseTypes(courseTypeDtos);

            ArrayList<DisciplineDto> disciplinesDtos = new ArrayList<DisciplineDto>();
            for (Discipline discEntity : dscplRepo.findAll()) {
                DisciplineDto discDto = modelMapper.map(discEntity,DisciplineDto.class);
                disciplinesDtos.add(discDto);
            }
            timetableresponsedto.setDisciplines(disciplinesDtos);

            ArrayList<AgeDto> agesDtos = new ArrayList<AgeDto>();
            for (Age ageEntity : agrp.findAll()) {
                AgeDto agDto = modelMapper.map(ageEntity,AgeDto.class);
                agesDtos.add(agDto);
            }
            timetableresponsedto.setAges(agesDtos);

            ArrayList<SpeedDto> speedsDtos = new ArrayList<SpeedDto>();
            for (Speed speedEntity : spdRp.findAll()) {
                SpeedDto spdDto = modelMapper.map(speedEntity,SpeedDto.class);
                speedsDtos.add(spdDto);
            }
            timetableresponsedto.setSpeeds(speedsDtos);

           ArrayList<LanguageDto> langDtos = new ArrayList<LanguageDto>();
            genRepo.getLanguages().stream().forEach(langEntity -> {
                LanguageDto lgDto = modelMapper.map(langEntity,LanguageDto.class);
                langDtos.add(lgDto);
            });
            timetableresponsedto.setLanguages(langDtos);

         /*    ArrayList<BuildingDto> buildingDtos = new ArrayList<BuildingDto>();
            genRepo.getBuildings().stream().forEach(bldEntity -> {
                BuildingDto dtoBuild = modelMapper.map(bldEntity, BuildingDto.class);
                buildingDtos.add(dtoBuild);
            });
            timetableresponsedto.setBuildings(buildingDtos);
*/
            return timetableresponsedto;
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
}