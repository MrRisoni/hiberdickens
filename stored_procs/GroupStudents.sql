


SELECT gs.student_id , gs.joined, CONCAT(m.name,' ',m.surname) AS fullName,
CASE WHEN GETDATE() > gs.dropped THEN  1 ELSE 0 END AS hasDropped,
gs.total_payed AS hasPayed, gs.total_debt AS remainingDebt,gs.updated_at
FROM group_students gs
JOIN students s ON s.id = gs.student_id
JOIN members m ON m.id = s.member_id
WHERE gs.group_id = 1
CALL GetGroupStudents(1)



 SELECT

  CASE
  (SELECT COUNT(id) AS records FROM  student_payed
  WHERE student_id = 1 AND group_id =1)
 WHEN 0 THEN 'Never'
 ELSE

 (SELECT TOP 1 CAST(created_at AS CHAR)  FROM  student_payed
    WHERE student_id = 1 AND group_id =1 ORDER BY created_at DESC)
 END