--Assignment 2--

--drop table  Treatments, ClientInfo, Position;
--drop table  T_Rates, Bus_Activities, Staff2;

CREATE TABLE Position(

position_ID int PRIMARY KEY,
position varchar(50)

);

INSERT INTO Position VALUES (1401, 'Manager');
INSERT INTO Position VALUES (1402, 'Therapist');
INSERT INTO Position VALUES (1403, 'General Staff');
INSERT INTO Position VALUES (1404, 'I.T Mananger');

select * from Position;

CREATE TABLE Staff2(

staff_ID int PRIMARY KEY,
firstName varchar(50),
lastName varchar(50),
position_ID int FOREIGN KEY REFERENCES Position,
timedServ BIT not null 

);

INSERT INTO Staff2 VALUES (2901, 'Michael', 'Angeles', 1401, 0);
INSERT INTO Staff2 VALUES (2902, 'Monte', 'Santos', 1402, 1);
INSERT INTO Staff2 VALUES (2903, 'Johnry', 'Pineda', 1404, 0);
INSERT INTO Staff2 VALUES (2904, 'Christina', 'Wiria', 1402, 0);
INSERT INTO Staff2 VALUES (2905, 'Fenix', 'Martinez', 1403, 0);
INSERT INTO Staff2 VALUES (2906, 'Richard', 'Santos', 1403, 0);
INSERT INTO Staff2 VALUES (2907, 'Joan', 'Angeles', 1402, 0);
INSERT INTO Staff2 VALUES (2908, 'Jason', 'Collins', 1402, 1);
INSERT INTO Staff2 VALUES (2909, 'Kim', 'Kardashian', 1402, 1);

select * from Staff2;

CREATE TABLE T_Rates(

therapist_ID int PRIMARY KEY,
staff_ID int FOREIGN KEY REFERENCES Staff2,
halfHourly float(10),
hourly float(10),

);

INSERT INTO T_Rates VALUES (501, 2902, 20.00, 40.00);
INSERT INTO T_Rates VALUES (502, 2908, 40.00, 80.00);
INSERT INTO T_Rates VALUES (503, 2909, 50.00, 100.00);

select * from T_Rates;

CREATE TABLE Treatments(

treatment_ID int PRIMARY KEY,
t_type varchar(50),
timeBased BIT not null,
price float(10),

);

INSERT INTO Treatments VALUES (6001, 'Manicure', 0, 25.00);
INSERT INTO Treatments VALUES (6002, 'Pedicure', 0, 25.00);
INSERT INTO Treatments VALUES (6003, 'Facial', 1, null);
INSERT INTO Treatments VALUES (6004, 'Massage', 1, null);
INSERT INTO Treatments VALUES (6005, 'Threading', 0, 30.00);

select * from Treatments;

CREATE TABLE Specialise(

s_ID int PRIMARY KEY,
treatment_ID int FOREIGN KEY REFERENCES Treatments,
staff_ID int FOREIGN KEY REFERENCES Staff2,

);

INSERT INTO Specialise VALUES (5500, 6001, 2902);
INSERT INTO Specialise VALUES (5511, 6002, 2902);
INSERT INTO Specialise VALUES (5522, 6003, 2902);
INSERT INTO Specialise VALUES (5533, 6004, 2902);
INSERT INTO Specialise VALUES (5544, 6005, 2902);
INSERT INTO Specialise VALUES (5555, 6001, 2904);
INSERT INTO Specialise VALUES (5566, 6002, 2904);
INSERT INTO Specialise VALUES (5577, 6005, 2904);
INSERT INTO Specialise VALUES (5588, 6001, 2907);
INSERT INTO Specialise VALUES (5599, 6002, 2907);
INSERT INTO Specialise VALUES (5600, 6005, 2907);
INSERT INTO Specialise VALUES (5601, 6001, 2908);
INSERT INTO Specialise VALUES (5602, 6002, 2908);
INSERT INTO Specialise VALUES (5603, 6003, 2908);
INSERT INTO Specialise VALUES (5604, 6004, 2908);
INSERT INTO Specialise VALUES (5605, 6005, 2908);
INSERT INTO Specialise VALUES (5606, 6001, 2909);
INSERT INTO Specialise VALUES (5607, 6002, 2909);
INSERT INTO Specialise VALUES (5608, 6003, 2909);
INSERT INTO Specialise VALUES (5609, 6004, 2909);
INSERT INTO Specialise VALUES (5610, 6005, 2909);

select * from Specialise;

CREATE TABLE ClientInfo(

client_ID int PRIMARY KEY,
firstName varchar(50),
lastName varchar(50),
phoneNumber varchar(50),
email varchar(50) 

);

INSERT INTO ClientInfo VALUES (111, 'Bill', 'Gates', '0419874625', 'billgates@gmail.com');
INSERT INTO ClientInfo VALUES (222, 'Ronney', 'Coleman', null, 'r_coleman@hotmail.com');
INSERT INTO ClientInfo VALUES (333, 'Smurf', 'Cody', '0458625320', 'smurf@me.com');
INSERT INTO ClientInfo VALUES (444, 'Julia', 'Cody', '0457892111', 'julia_C@me.com');
INSERT INTO ClientInfo VALUES (555, 'Max', 'Holloway', null, 'm_hollway@gmail.com');

select * from ClientInfo;

CREATE TABLE Bus_Activities(

booking_ID int  PRIMARY KEY,
"date" datetime,
staff_ID int FOREIGN KEY REFERENCES Staff2,
client_ID int FOREIGN KEY REFERENCES ClientInfo,
treatment_ID int FOREIGN KEY REFERENCES Treatments,
walk_Ins BIT not null

);

INSERT INTO Bus_Activities VALUES (2211, '2021/10/10 09:00:00', 2904, null, 6005, 1);
INSERT INTO Bus_Activities VALUES (2222, '2021/10/10 09:30:00', 2904, 111, 6004, 0);
INSERT INTO Bus_Activities VALUES (2233, '2021/06/25 09:30:00', 2907, 333, 6004, 0);
INSERT INTO Bus_Activities VALUES (2244, '2021/06/25 10:30:00', 2907, 333, 6001, 0);
INSERT INTO Bus_Activities VALUES (2255, '2021/06/25 11:00:00', 2907, 333, 6002, 0);
INSERT INTO Bus_Activities VALUES (2266, '2021/06/25 09:30:00', 2908, 444, 6003, 0);
INSERT INTO Bus_Activities VALUES (2277, '2021/06/25 10:30:00', 2908, null, 6004, 1);
INSERT INTO Bus_Activities VALUES (2288, '2021/06/25 11:00:00', 2906, 555, 6002, 0);
INSERT INTO Bus_Activities VALUES (2299, '2020/04/25 15:30:00', 2901, null, 6005, 1);
INSERT INTO Bus_Activities VALUES (2300, '2019/08/17 09:00:00', 2907, null, 6004, 1);
INSERT INTO Bus_Activities VALUES (2311, '2019/08/25 12:30:00', 2904, null, 6003, 1);

select * from Bus_Activities;

-- Question 3 ii (a) --

select s.Firstname, s.LastName, t.t_type 
from staff2 s , Treatments t
where s.timedServ = 'true' and t.timebased = 'true'
order by t.t_type asc;

select * from Treatments;
select * from Staff2;

-- Question 3 ii (b) --

select s.firstName, s.lastName
from Bus_Activities ba inner join Staff2 s on (ba.staff_ID = s.staff_ID)
where "date" >= '2021/06/25' and "date" < '2021/06/26' 
group by s.firstName, s.lastName
having count("date") > 0

select * from Bus_Activities;
select * from Staff2;

-- Question 3 ii (c) --

select c.firstName, c.lastName, count(ba.client_ID) as numberOfbookings
from ClientInfo c left join Bus_Activities ba on (ba.client_ID = c.client_ID)
group by c.firstName, c.lastName;

select * from Bus_Activities;
select * from ClientInfo;

-- Question 3 ii (d) --

select firstname, lastname, t.t_type,
case when t.timebased = '0' then 'NO'
else 
'YES' 
END as Timebased

from Staff2 s
	inner join specialise s2 on (s.staff_ID = s2.staff_ID)
	inner join treatments t on (t.treatment_ID = s2.treatment_ID)

Order by Firstname, Lastname, t.timebased asc

select * from Staff2;
select * from Treatments;
select * from Specialise;

-- Question 3 ii (e) --

select distinct(t.t_type), s.firstName, s.lastName,t2.halfhourly, t2.hourly 

from treatments t 
	inner join Specialise S2 on (t.treatment_ID = S2.treatment_ID)
	inner join staff2 S on (S.staff_id = S2.staff_ID)
	inner join t_rates t2 on (t2.staff_ID = s.staff_ID)

Where t.timeBased = 1 and s.timedServ = 1 and t2.hourly = (select min(hourly) from t_rates)

select * from Staff2;
select * from Treatments;
select * from T_Rates;


-- Question 3 iii --

select "date", count(date) as double_booked
from Bus_Activities
where "date" = '2019/08/25 12:30:00'
group by "date"
having count("date") > 1;

select * from Bus_Activities;






