--create database assignment;

use assignment;

create table address( 
	add_id int primary key,
	country varchar(15),
	state varchar(15),
	city varchar(15),
	street varchar(15),
	zipcode int,
	create_ts datetime default getdate(),
	last_updated_ts datetime default getdate()
);
create table department(
      department_id int primary key,
	  department_name varchar(15),
	  department_code varchar(4) NOT NULL,
	  address_id int foreign key references address(add_id),
	  department_head_id int NOT NULL

);
create table emp(
     emp_id int primary key,
	 first_name varchar(20) NOT NULL,
	 last_name varchar(20),
	 email varchar(20) NOT NULL,
	 phone_number int,
	 dept_id int foreign key references department(department_id),
	 address_id int foreign key references address(add_id),
	 blood_group varchar(10),
	 dob date,
	 doj date,
	 dot date,
	 created_ts datetime default getdate(),
	 emp_references varchar(20),
	 emp_role varchar(10),
	 salary float,
	 band int,
	 report_to int

);




insert into address(add_id, country, state, city, street, zipcode, create_ts, last_updated_ts) values(1, 'US', 'texas', 'arlington','cooperstreet',76012, GETDATE(), GETDATE());
select * from address;

insert into department(department_id, department_name, department_code, address_id, department_head_id) values(1, 'computer','cse', 1, 1);
select * from department;

insert into emp(emp_id, first_name, last_name, email, phone_number, dept_id, address_id, blood_group, dob, doj, created_ts, emp_references, emp_role, salary, band,report_to) 
values(1,'Pavan','thotakura','pavanp@gmail.com',123456,1,1,' o+','2000-11-11','2024-01-24', GETDATE(), 'empref','dev',10000,1,1);
select * from emp;


insert into address(add_id, country, state, city, street, zipcode, create_ts, last_updated_ts) values(2, 'US', 'texas', 'arlington','cooperstreet 1',76012, GETDATE(), GETDATE());
insert into address(add_id, country, state, city, street, zipcode, create_ts, last_updated_ts) values(3, 'US', 'texas', 'arlington','cooperstreet 2',76012, GETDATE(), GETDATE());
insert into address(add_id, country, state, city, street, zipcode, create_ts, last_updated_ts) values(4, 'US', 'texas', 'arlington','cooperstreet 3',76012, GETDATE(), GETDATE());
insert into address(add_id, country, state, city, street, zipcode, create_ts, last_updated_ts) values(5, 'US', 'texas', 'arlington','cooperstreet 4',76012, GETDATE(), GETDATE());

insert into department(department_id, department_name, department_code, address_id, department_head_id) values(2, 'computer','cse', 2, 1);
insert into department(department_id, department_name, department_code, address_id, department_head_id) values(3, 'computer','cse', 3, 1);
insert into department(department_id, department_name, department_code, address_id, department_head_id) values(4, 'computer','cse', 3, 1);
insert into department(department_id, department_name, department_code, address_id, department_head_id) values(5, 'computer','cse', 4, 1);

insert into emp(emp_id, first_name, last_name, email, phone_number, dept_id, address_id, blood_group, dob, doj, created_ts, emp_references, emp_role, salary, band,report_to) 
values(2,'Prakash','pavan','pavanp1@gmail.com',1234567,2,4,' o+','2001-11-11','2023-01-24', GETDATE(), 'empref','analyst',10000,1,1);

select * from address;
select * from department;
select * from emp;

update address set zipcode=76015,last_updated_ts=GETDATE() where add_id=4;
update department set department_head_id=2 where department_id=4;
update emp set dot='2024-08-27' where emp_id=2;

select * from address;
select * from department;
select * from emp;

delete emp where emp_id=1;
delete department where department_id=3;
delete address where add_id=5;

select * from address;
select * from department;
select * from emp;

alter table emp drop column report_to;
alter table department drop column department_head_id;

select * from address;
select * from department;
select * from emp;

alter table emp 
alter column band varchar(20);

select DATEDIFF(YEAR, dob, GETDATE()) as age
from emp;

select CAST(GETDATE() as date) as date;

select doj, round(DATEDIFF(MONTH,doj,GETDATE())/12.0, 1) as exp
from emp;

alter table emp add comment_col varchar(100);
alter table department add department_comment_col varchar(100);
alter table address add address_comment_col varchar(100);

select * from address;
select * from department;
select * from emp;

go
create or alter view emp_info as (

 select 
 case when emp.last_name is not null then concat(emp.first_name ,' ' , emp.last_name) else emp.first_name end
 as Name
 ,concat(street, ', ', city, ', ', state, ', ', country,',', zipcode) as Address
 ,department.department_name
from emp inner join address on emp.address_id=address.add_id
inner join department on department.department_id=emp.dept_id

	);


--go
--alter table department drop constraint address_id;
--alter table emp drop constraint dept_id;

--go
--truncate table emp;
--truncate table department;
--truncate table address;

select * from address;
select * from department;
select * from emp;


DROP table emp;
DROP table department;
DROP table address;