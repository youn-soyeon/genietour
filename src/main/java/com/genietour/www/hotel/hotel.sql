CREATE OR REPLACE VIEW Hot_Room_View
AS
SELECT *
FROM Hotel h NATURAL JOIN Room r

select * from hotel;
select * from room;
select * from hot_reservation;
select * from hot_room_view;
select * from hot_room_res_view;

select * from hot_room_view where ;
insert into hot_reservation values(1,'이서영','lsy@naver.com','010-1122-3344','korea','w','12:00','2016-04-30','2016-04-30',50000,'hi','lsy','1')
select count(*) from hotel

insert into hotel values(1,'은지호텔','한국','서울','영등포구', '02-1545-1545','www.hotel.com','와이파이')
delete from hotel where hot_code=1;

select hot_code, hot_name, country, city, address, tel, homepage, options from hotel
select hot_code, hot_name, country, city, address, tel, homepage, options from hotel where hot_name='은지호텔'
update room set hot_code='5' where hot_code='1'

insert into room(room_code, room_type, price, vacancy, hot_code) values(1,'싱글룸',10000, 5, 1)

select * from room where price>15000

select hot_code, hot_name, country, city, address, tel, homepage, options, room_code, room_type, price, vacancy from hot_room_view;
--hr.hot_code, hr.hot_name, hr.country, hr.city, hr.address, hr.tel, hr.homepage, hr.options, hr.room_code, hr.room_type, hr.price, hr.vacancy
select * from hot_room_view where city='서울'

SELECT *
FROM Hot_Room_View
WHERE city = '서울'

SELECT hr.hot_code, hr.hot_name, hr.country, hr.city, hr.address, hr.tel, hr.homepage, hr.options, hr.room_code, hr.room_type, hr.price, hr.vacancy
FROM
    Hot_Room_View hr,
    (SELECT * FROM Hot_Room_Res_View
     WHERE stay_date='2016-06-02' AND vacancy=0) htemp
WHERE hr.city = '서울'
AND hr.room_code != htemp.room_code


SELECT *
FROM Hot_Room_Res_View
WHERE stay_date='2016-06-02' AND vacancy=0;

select distinct * from hot_room_view hr join hot_room_res_view hrr on hr.room_code=hrr.room_code where hrr.vacancy >0



SELECT
		hot_code AS hotCode, 
		hot_name AS hotName, 
		country, 
		city, 
		address, 
		tel, 
		homepage, 
		options, 
		room_code AS roomCode,
		room_type AS roomType, 
		price, 
		vacancy 
	FROM Hot_Room_View
	where hot_code = 5;
	
	
SELECT *
	FROM Hotel
	WHERE hot_code NOT IN 
	(SELECT hot_code FROM Hot_Room_Res_View WHERE stay_date>='2016-04-30' AND stay_date<='2016-04-30' AND vacancy<=0)

   
   SELECT * FROM Hot_Room_View where city='서울' 
   AND hot_code IN (SELECT hot_code FROM Hot_Room_View WHERE room_type='싱글룸' 
   AND room_code NOT IN (SELECT room_code FROM Hot_Room_Res_View WHERE stay_date>='2016-04-30' AND stay_date<='2016-04-30' AND vacancy<=0 )
   )GROUP BY hot_code


