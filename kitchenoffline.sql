create database kitchenoffline;
create table student(sid int auto_increment primary key, studentName varchar(25), courseJoined varchar(30));
insert into student (studentName,courseJoined) values ("karan","java");
select * from student;
rollback;
commit;
set autocommit = 0;
DELETE FROM student WHERE studentName='karan';
set sql_safe_updates = 0;

select sysdate();
select length('Apple');
show tables;
use kitchenoffline;
create table product (pid int(5),prname varchar(20),prprice float,prqty int(5), prcost float,prtype char(1));
desc product;
insert into product(pid,prname,prprice,prqty,prcost,prtype)
values (1,'Gemini',55,5,80,'D'),(2,'Lipton',65,7,50,'L'),(3,'Assam chai',60,15,30,'L');
select * from product;
create table myproduct as select * from product;
select * from myproduct;
show tables;
drop table product;
set sql_safe_updates = 0;
delete from myproduct;
select count(*) from product where prtype='L' and prcost not between 70 and 90;
update product set prcost = prprice * prqty;
select sum(prcost) from product;
select prtype,sum(prcost) from product where prtype in ('L','D') group by prtype;
select prname,prprice,prtype from product where prtype not in ('L') order by prname;
alter table product
modify prname varchar(50) not null;
alter table product
modify pid varchar(50) unique;
use kitchenoffline;
create table voter(vid int, vname varchar(50) not null, vage int check (vage>=18));
insert into voter values (1,'saloni',22); 
select  * from voter;
alter table voter modify vid int primary key;
desc voter;
select rowid vid from voter;


insert into product
values (null,'nallable',60,35,95,'C');
select * from product where pid is null;
 
      
      
      
      use kitchenoffline;
      CREATE TABLE buildings (
    building_no INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);
CREATE TABLE rooms (
    room_no INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(255) NOT NULL,
    building_no INT NOT NULL,
    FOREIGN KEY (building_no)
        REFERENCES buildings (building_no)
        ON DELETE CASCADE
);
INSERT INTO buildings(building_name,address)
VALUES('ACME Headquaters','3950 North 1st Street CA 95134'),
      ('ACME Sales','5000 North 1st Street CA 95134');
      SELECT * FROM buildings;
      INSERT INTO rooms(room_name,building_no)
VALUES('Amazon',1),
      ('War Room',1),
      ('Office of CEO',1),
      ('Marketing',2),
      ('Showroom',2);
      SELECT * FROM rooms;
      DELETE FROM buildings 
WHERE building_no = 2;
SELECT * FROM rooms;

create user saloni identified by 'jamadar';
show databases;
grant select
on kitchenoffline.product
to saloni;

create user saloni identified by 'jamadar';
show databases;
grant insert
on kitchenoffline.product
to saloni;
show grants for saloni;
revoke select,insert
on kitchenoffline.product
from saloni;
drop user saloni;

use kitchenoffline;
select * from product;
select prname,prprice
from product
where prprice>55 and prtype='L';
select prname,prprice
from product
where prprice<=55;
select * from product
where prname like 'G%';
select * from product
where prname in ('Gemini','Lipton');

select prname,prprice from product 
where prprice>55 and prtype='L' or prtype='C';
select prname,prprice from product 
where prprice>55 and prtype='L' or prtype='C' and prname is not null; 








use kitchenoffline;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;

CREATE TABLE t1 (
    id INT PRIMARY KEY
);

CREATE TABLE t2 (
    id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4);

SELECT id
FROM t1
UNION
SELECT id
FROM t2;

SELECT id
FROM t1
UNION ALL
SELECT id
FROM t2;


use kitchenoffline;
