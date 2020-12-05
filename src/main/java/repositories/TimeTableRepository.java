package repositories;

import hqlmappers.TimetableDTO;

import java.util.List;

public class TimeTableRepository extends Repository {

    public List<TimetableDTO> getTimetable() {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.TimetableDTO(hs.id, gr.id,hr.id, crs.title,mb.name, ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
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
    }

}

