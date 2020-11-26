DELIMITER //

CREATE PROCEDURE get_group_students(IN groupId BIGINT)
BEGIN
SELECT gs.student_id , gs.joined,gs.dropped, m.name,
gs.total_payed AS hasPayed, gs.total_debt AS remainingDebt  
FROM group_students gs  
JOIN students s ON s.id = gs.student_id  
JOIN members m ON m.id = s.member_id  
WHERE gs.group_id = groupId;
END //
DELIMITER ;


CALL get_group_students(1)