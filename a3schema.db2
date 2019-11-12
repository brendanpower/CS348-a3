--
--  Schema definition for "Student-class-course" A2 (for DB2)
--
echo "droping preexisting tables"

drop table professor
drop table student
drop table course
drop table class
drop table schedule
drop table enrollment
drop table mark

echo "creating tables"

create table professor ( \
   pnum     integer not null, \ 
   pname    varchar(30) not null, \
   office   char(7) not null, \
   dept     char(2) not null, \
   primary key (pnum))

create table student ( \
   snum      integer not null, \
   sname     varchar(30) not null, \
   year      integer not null,  \
   primary key (snum))

create table course ( \
   cnum      char(6) not null, \
   cname     varchar(50) not null, \
   primary key (cnum))

create table class ( \
   cnum      char(6) not null, \
   term      char(3) not null, \
   section   integer not null, \
   pnum      integer not null, \
   primary key (cnum,term,section), \
   foreign key (cnum) references course(cnum), \
   foreign key (pnum) references professor(pnum))

create table schedule ( \
   cnum      char(6) not null, \
   term      char(3) not null, \
   section   integer not null, \
   day       varchar(10) not null, \
   time      time not null, \
   room      char(7) not null, \
   primary key (cnum,term,section,day,time), \
   foreign key (cnum,term,section) references class(cnum,term,section))

create table enrollment ( \
   snum      integer not null, \
   cnum      char(6) not null, \
   term      char(3) not null, \
   section   integer not null, \
   primary key (snum,cnum,term,section), \
   foreign key (snum) references student(snum), \
   foreign key (cnum,term,section) references class(cnum,term,section))

create table mark ( \
   snum      integer not null, \
   cnum      char(6) not null, \
   term      char(3) not null, \
   section   integer not null, \
   grade     integer not null, \
   primary key (snum,cnum,term,section), \
   foreign key (snum,cnum,term,section) references enrollment(snum,cnum,term,section))


