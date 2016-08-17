SELECT 
		seat_code,
		price,
		vacancy,
		fli_code,
		seat_type
FROM 	Flight_Seat_View
WHERE 	seat_code = 1
AND		dep_date = DATE_FORMAT('2016-04-16', 'YYYY-MM-DD') 
AND		vacancy > 0;