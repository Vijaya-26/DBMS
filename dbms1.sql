create database vijinsurance;
use vijinsurance; 
create table person(
driver_id char(10),
name char(10),
address char(20)
);
desc person;
create table car(
regno char(10),
model char(20),
year int
);
desc car;
create table accident(
report_number int,
date date,
location char(20)
);

alter table person add primary key(driver_id);
alter table car add primary key(regno);
alter table accident add primary key(report_number);
drop table owns;
create table owns(
driver_id char(10),
regno char(10),
foreign key(driver_id) references person(driver_id) on delete cascade,
foreign key(regno) references car(regno) on delete cascade
);
create table participated(
driver_id char(10),
regno char(10),
report_number int,
damage_amount int,
foreign key(driver_id) references person(driver_id) on delete cascade,
foreign key(regno) references car(regno) on delete cascade,
foreign key(report_number) references accident(report_number) on delete cascade
);
desc person;
desc car;
desc accident;
desc owns;
desc participated;

insert into person values("D1","anuj","kormangala");
insert into person values("D2","keertan","jayanagar");
insert into person values("D3","anuja","jp nagar");
insert into person values("D4","vij","basvangudi");
insert into person values("D5","umang","bull road");
select * from person;
insert into car values("127","getz",2001);
insert into car values("178","toyota",2012);
insert into car values("138","baleno",2007);
insert into car values("142","dzire",2008);
insert into car values("798","jaguar",2000);
select * from car;
insert into accident values("12067","2001-12-12","kormangala");
insert into accident values("6767","2001-12-13","jp nagar");
insert into accident values("1347","2001-12-14","basavanagudi");
insert into accident values("1223","2001-12-15","bull road");
insert into accident values("8767","2001-12-16","korma");
select * from accident;
insert into owns values("D1","127");
insert into owns values("D2","178");
insert into owns values("D3","138");
insert into owns values("D4","142");
insert into owns values("D5","798");
select * from owns;
insert into participated values("D1","127","12067",12000);
insert into participated values("D2","178","6767",13000);
insert into participated values("D3","138","1347",14000);
insert into participated values("D4","142","1223",15000);
insert into participated values("D5","798","8767",16000);
select * from participated;

update participated set damage_amount = 25000 where report_number = 12067 and regno = "127";
select * from participated;
insert into accident values("12456","2005-6-22","bazar");
select count(*) from accident where date LIKE '2001%';
select count(*) from car where model = "jaguar";
select count(report_number)CNT from car c,participated p where c.regno=p.regno and model= "getz";


Select * from participated order by damage_amount desc;
select avg(damage_amount) from participated;
delete from participated where damage_amount<(select avg(damage_amount)from participated);
delete from participated where damage_amount<(select avg(damage_amount));
select * from participated;
Select name from person a, participated b where a.driver_id=b.driver_id and damage_amount>(select avg(damage_amount) from participated);
select max(damage_amount) from participated;



