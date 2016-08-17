SELECT 	* FROM Flight;

INSERT 	INTO Flight
VALUES 	(2, 'B001', '아시아나항공', '홍콩', '인천', '2016/04/12', '2016/04/16');

INSERT 	INTO Flight
VALUES 	(8, 'B001', '대한항공', '프라하', '인천', '2016-05-10 12:00:00', '2016-05-10 15:00:00');

INSERT 	INTO Flight
VALUES 	(1, 'B001', '대한항공', '프라하', '인천', NOW(), NOW());

UPDATE 	Flight
SET dep_date = '2016-05-10 21:20:00',
	arr_date = '2016-05-11 06:25:00'
WHERE fli_code = 6;

SELECT 	DISTINCT dep_city 
FROM 	Flight;

SELECT 	DISTINCT arr_city 
FROM 	Flight 
WHERE 	dep_city = '인천';

SELECT 	*
FROM 	Flight f 
JOIN 	Seat s  ON 	f.fli_code = s.fli_code 
WHERE 	f.dep_city = '인천'
AND 	f.arr_city = '런던'
AND 	f.dep_date = '2016-04-12';

SELECT	*
FROM 	Seat 
WHERE 	fli_code = 1;