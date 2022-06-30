create database vijsupplier;
use vijsupplier;

CREATE TABLE supplier(sid int,
 sname char(30),
 address char(30),
 PRIMARY KEY(sid));

CREATE TABLE parts(
 pid int,
 pname char(30),
 color char(30),
 PRIMARY KEY(pid));
 
CREATE TABLE catalog(sid int,
 pid int,
 cost int,
 foreign key(sid) references supplier(sid),
 foreign key(pid) references parts(pid));
 
 desc supplier;
 
INSERT INTO supplier VALUES(110,'Ananad pvt ltd','Jamshedpur');
INSERT INTO supplier VALUES(123,'Shrinivas hardware','Bangalore');
INSERT INTO supplier VALUES(785,'Raghav industries','Vellore');
INSERT INTO supplier VALUES(345,'Bablu enterpries','Delhi');
INSERT INTO supplier VALUES(876,'Ramnihal motoparts','Bombay');

INSERT INTO supplier VALUES
