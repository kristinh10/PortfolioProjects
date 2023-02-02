--Staff shifts and costs for August 10-14, 2022

SELECT
rota.date,
staff.first_name,
staff.last_name,
staff.hourly_rate,
shift.start_time,
shift.end_time,
((HOUR (TIMEDIFF( shift.end_time, shift.start_time ))* 60)+(MINUTE (timediff( shift.end_time, shift.start_time ))))/ 60 AS hours_in_shift,
((HOUR (TIMEDIFF( shift.end_time, shift.start_time ))* 60)+(MINUTE (timediff( shift.end_time, shift.start_time ))))/ 60 * staff.hourly_rate AS staff_cost 
FROM rota
LEFT JOIN staff ON rota.staff_id = staff.staff_id
LEFT JOIN shift ON rota.shift_id = shift.shift_id