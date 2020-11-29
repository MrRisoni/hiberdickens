DELIMITER //

CREATE PROCEDURE get_student_timetable(IN studentId BIGINT,fromDate DATETIME,toDate DATETIME)
BEGIN
SELECT hs.id AS histId,gr.id AS groupId ,uhr.id AS uhrId, 
crs.title AS courseTitle ,ag.title AS ageTitle ,
spd.title AS speedTitle ,hs.started ,hs.duration, 
rm.title AS roomTitle, hs.cancelled, hs.wage, hs.fee
FROM history hs
JOIN groupakia gr ON gr.id= hs.group_id
JOIN rooms rm ON rm.id = hs.room_id
JOIN hours uhr ON uhr.id =hs.hour_id
JOIN ages ag ON ag.id = gr.age_id
JOIN speeds spd ON spd.id = gr.speed_id
JOIN courses crs ON crs.id = gr.course_id
JOIN group_students grst ON grst.group_id = gr.id
WHERE grst.student_id = studentId
AND hs.started >= fromDate
AND hs.started <= toDate 
ORDER  BY hs.started ASC;
END //
DELIMITER ;

CALL get_student_timetable(1,'2019-09-01 00:00:00','2019-10-01 00:00:00')