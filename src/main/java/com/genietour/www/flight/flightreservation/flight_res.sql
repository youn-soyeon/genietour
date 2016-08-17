SELECT * FROM fli_reservation;

SELECT count(*) FROM fli_reservation WHERE mem_id='kim';

INSERT INTO fli_reservation(fli_res_code, passport, kor_name, eng_name, birth, gender, phone, res_date, comments, mem_id, seat_code)
VALUES (1, 'a1234', '김유정', 'kimyujeong', '1996-01-01', '여자', '010-5555-5555', '2016-05-02', '코멘트', 'kim', 1);
INSERT INTO fli_reservation(fli_res_code, passport, kor_name, eng_name, birth, gender, phone, res_date, comments, mem_id, seat_code)
VALUES (2, 'a1234', '김유정', 'kimyujeong', '1996-01-01', '여자', '010-5555-5555', '2015-07-15', '코멘트', 'kim', 1);
INSERT INTO fli_reservation(fli_res_code, passport, kor_name, eng_name, birth, gender, phone, res_date, comments, mem_id, seat_code)
VALUES (59, 'a1234', '김유정', 'kimyujeong', '1996-01-01', '여자', '010-5555-5555', DATE_FORMAT(SYSDATE(),'%Y-%m-%d'), '코멘트', 'kim', 1);
SELECT 
	fli_res_code AS fliResCode, 
	passport, 
	kor_name AS korName, 
	eng_name AS engName, 
	birth, 
	gender, 
	phone, 
	res_date AS resDate, 
	comments, 
	mem_id AS memId, 
	seat_code AS seatCode
FROM fli_reservation;

SELECT 
	fli_res_code AS fliResCode, 
	passport, 
	kor_name AS korName, 
	eng_name AS engName, 
	birth, 
	gender, 
	phone, 
	res_date AS resDate, 
	comments, 
	mem_id AS memId, 
	seat_code AS seatCode
FROM fli_reservation
WHERE kor_name = '김유정';

SELECT 
	fli_res_code AS fliResCode, 
	passport, 
	kor_name AS korName, 
	eng_name AS engName, 
	birth, 
	gender, 
	phone, 
	res_date AS resDate, 
	comments, 
	mem_id AS memId, 
	seat_code AS seatCode
FROM fli_reservation
WHERE mem_id = 'kim';


SELECT 
	fli_res_code AS fliResCode, 
	passport, 
	kor_name AS korName, 
	eng_name AS engName, 
	birth, 
	gender, 
	phone, 
	res_date AS resDate, 
	comments, 
	mem_id AS memId, 
	seat_code AS seatCode
FROM fli_reservation
WHERE res_date = '2016-05-02';


DELETE FROM fli_reservation WHERE fli_res_code=3;

UPDATE fli_reservation SET eng_name='hong-gildong', phone='010-5656-5656', comments='', seat_code='111'
WHERE mem_id='hong' and fli_res_code=3;
SELECT * FROM fli_reservation;