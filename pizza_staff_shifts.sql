SELECT
rota.date,
staff.first_name,
staff.last_name,
staff.hourly_rate,
shift.start_time,
shift.end_time
FROM rota
LEFT JOIN staff ON rota.staff_id = staff.staff_id
LEFT JOIN shift ON rota.shift_id = shift.shift_id
