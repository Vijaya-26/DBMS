CREATE database vairlineflightdb;
USE vairlineflightdb;

CREATE TABLE flights(flno int, frm char(255), too char(255), distance int, departs time, arrives time, price integer, primary key(flno));
CREATE TABLE flights(flno int, frm char(255), distance int, departs time, arrives time, price integer, PRIMARY KEY(flno));
CREATE TABLE aircraft(aid int, anmae char(255), cruisingrange int,PRIMARY KEY(aid));
CREATE TABLE employee(eid int, ename char(255), salary int, PRIMARY KEY(eid));
CREATE TABLE certified(eid int, aid int, FOREIGN KEY (eid) REFERENCES employee(eid), FOREIGN KEY (aid) REFERENCES aircraft(aid));

INSERT INTO employees (eid,ename,salary) VALUES
(1,'jaya',30000),
(2,'vijaya',85000),
(3,'ronit',50000),
(4,'diya',45000),
(5,'rahul',90000),
(6,'Joshin',75000),
(7,'Ram',100000);
(8,'umang',12000);

INSERT INTO aircraft 
(aid,anmae,cruisingrange) values 
(123,'Airbus',1000), 
(302,'Boeing',5000), 
(306,'Jet01',5000), 
(378,'Airbus380',8000), 
(456,'Aircraft',500), 
(789,'Aircraft02',800), 
(951,'Aircraft03',1000);


INSERT INTO certified 
(eid,aid) VALUES 
(1,123), 
(2,123), 
(1,302), 
(5,302), 
(7,302), 
(1,306), 
(2,306), 
(1,378), 
(2,378), 
(4,378), 
(6,456), 
(3,456), 
(5,789), 
(6,789), 
(3,951), 
(1,951), 
(1,789);

INSERT INTO flights 
(flno,frm,too,distance,departs,arrives,price) VALUES 
(1,'Bangalore','Mangalore',360,'10:45:00','12:00:00',10000), 
(2,'Bangalore','Delhi',5000,'12:15:00','04:30:00',25000), 
(3,'Bangalore','Mumbai',3500,'02:15:00','05:25:00',30000), 
(4,'Delhi','Mumbai',4500,'10:15:00','12:05:00',35000), 
(5,'Delhi','Frankfurt',18000,'07:15:00','05:30:00',90000), 
(6,'Bangalore','Frankfurt',19500,'10:00:00','07:45:00',95000), 
(7,'Bangalore','Frankfurt',17000,'12:00:00','06:30:00',99000);

select anmae from aircraft a, certified c, employee e where a.aid=c.aid and c.eid=e.eid and e.eid IN(select e.eid from employee e where salary>80000);
SELECT c.eid,MAX(cruisingrange) FROM certified c,aircraft a WHERE c.aid=a.aid GROUP BY c.eid HAVING COUNT(*)>3;
SELECT DISTINCT e.ename FROM employee e WHERE e.salary<(SELECT MIN(f.price) FROM flights f WHERE f.frm='Bangalore' AND f.too='Frankfurt');
SELECT a.aid,a.anmae,AVG(e.salary) FROM aircraft a,certified c,employee e WHERE a.aid=c.aid AND c.eid=e.eid AND a.cruisingrange>1000 GROUP BY a.aid,a.anmae;
SELECT distinct e.ename FROM employee e,aircraft a,certified c WHERE e.eid=c.eid AND c.aid=a.aid AND a.anmae='Boeing';
SELECT a.aid FROM aircraft a WHERE a.cruisingrange> (SELECT MIN(f.distance) FROM flights f WHERE f.frm='Bangalore' AND f.too='Delhi');
SELECT DISTINCT f1.* from flights f1,flights f2 where (f1.frm = "Bangalore" and f1.too = "Frankfurt" AND hour(f1.arrives)<6) or (f1.frm = "Bangalore" and f2.too = "Frankfurt" and f1.too=f2.frm and hour(f2.arrives)<6);
(SELECT ename FROM employee WHERE salary>(SELECT avg(salary) FROM employee) EXCEPT (SELECT DISTINCT e2.ename from employee e2, certified c WHERE c.eid=e2.eid));
