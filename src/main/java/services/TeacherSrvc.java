package services;

import dtos.CourseDto;
import dtos.TeacherResponseDto;
import hqlmappers.TimetableDTO;
import logic.MiniHour;
import models.HibernateUtil;
import models.groups.HourModel;
import models.people.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.GeneralRepository;
import repositories.TeacherRepository;
import spring_repos.SprTeacherRepository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TeacherSrvc {

    @Autowired
    SprTeacherRepository tchRepoSpr;

    public TeacherResponseDto getTeacherDetails(Long teacherId)
    {
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

        Optional<Teacher> searchResult = tchRepoSpr.findById(teacherId);
        Teacher daskalos =searchResult.orElse(null);

        TeacherResponseDto responseDto = new TeacherResponseDto();

        responseDto.setRemainingDebt(daskalos.getRemainingDebt());
        responseDto.setCreated_at(daskalos.getMember().getCreated_at());
        responseDto.setCalculatedAt(daskalos.getCalculatedAt());
        responseDto.setFullName(daskalos.getMember().getName() + " " + daskalos.getMember().getSurname());
        responseDto.setMemberId(daskalos.getMember().getId());
        responseDto.setTeacherId(daskalos.getId());
       // rsp.put("courses",daskalos.getCourses());
        responseDto.setCourses(daskalos.getCourses().stream().map(crsObj -> {
            return new CourseDto(crsObj.getId(),crsObj.getTitle());
        }).collect(Collectors.toList()));

        TeacherRepository tchRepo = new TeacherRepository();
        responseDto.setPayments(tchRepo.getTeacherPayments(teacherId));
        responseDto.setDebts(tchRepo.getTeacherDebts(teacherId));

        List<TimetableDTO> timetabl = tchRepo.getTeacherTimeTable(teacherId);

        List<String> days = new ArrayList<>();

        days = timetabl.stream().map(el -> {
            try {
                return formatter.format(el.getStarted()).toString();
            } catch (Exception ex) {
                return "";
            }
        }).collect(Collectors.toList());

        days = days.stream().distinct().collect(Collectors.toList());
        days.add("#");
        days.add(0, "#");
        responseDto.setDays(days);

        GeneralRepository gRepo = new GeneralRepository();
        gRepo.setEntityManager(HibernateUtil.getEM());
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
            System.out.println(hourRanges.get(h).getTitle());
            ArrayList<String> thisHour = new ArrayList<>();

            thisHour.add(hourRanges.get(h).getTitle());

            for (int d = 1; d < days.size() - 1; d++) { // skip #
                ArrayList<String> matchedActivities = new ArrayList<>();

                for (TimetableDTO actObj : timetabl) {
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

        responseDto.setFinalTimeTabling(finalTimeTabling);
        return  responseDto;
    }
}
