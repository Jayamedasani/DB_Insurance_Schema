create database insuranceorganization;
use insuranceorganization;
create table hr(
	hrid int not null,
    hrname varchar(40),
    allowedit bit(1),
    cyclestatus bit(1),
    primary key (hrid));
create table addcycle(
	cycleid int not null,
    hrid int not null,
    years year,
    providername varchar(20),
    primary key(cycleid,hrid),
    foreign key(hrid) references hr(hrid));
create table cycletopupdetails(
    topupid int not null,
    cycleid int not null,
    amount int,
    primary key(topupid,cycleid),
    foreign key(cycleid) references addcycle(cycleid));
create table bloodgroups(
	bloodgroupid int not null,
    groupname varchar(10),
    primary key(bloodgroupid));
create table maritalstatus(
	maritalid bit(1) not null,
    maritalstatus varchar(10),
    primary key (maritalid) );
create table employee(
	employeeid int not null,
    cycleid int not null,
    phnno bigint,
    bloodgroupid int,
    maritalid bit(1),
    primary key(employeeid,cycleid),
    foreign key(cycleid) references addcycle(cycleid),
    foreign key (bloodgroupid) references bloodgroups(bloodgroupid),
    foreign key(maritalid) references maritalstatus(maritalid));
create table dependentgroups(
	dependentgroupid int not null,
    relation varchar(20),
    primary key(dependentgroupid));
create table dependent(
	employeeid int not null,
    dependentid int not null,
    dependentgroupid int,
    dependentdob date,
    dependentrelation varchar(20),
    primary key(employeeid,dependentid),
    foreign key(employeeid) references employee(employeeid),
    foreign key(dependentgroupid) references dependentgroups(dependentgroupid));
    alter table dependent add column dependentname varchar(40);
create table nominee(
	employeeid int not null,
    nomineename varchar(40),
    nomineedob date,
    nomineerelation varchar(20),
    primary key(employeeid),
    foreign key (employeeid) references employee(employeeid));
create table employeetopup(
		employeeid int not null,
        topupid int not null,
        primary key(topupid,employeeid),
        foreign key(employeeid) references employee(employeeid),
        foreign key(topupid) references cycletopupdetails(topupid));
create table hrinsurance(
	hrid int not null,
    hrname varchar(40),
    phnno bigint,
    bloodgroupid int,
    maritalid bit(1),
    primary key (hrid),
    foreign key(hrid) references hr(hrid),
    foreign key(bloodgroupid) references bloodgroups(bloodgroupid),
    foreign key(maritalid) references maritalstatus(maritalid));
create table hrnominee(
	hrid int not null,
    nomineename varchar(40),
    nomineedob date,
    nomineerelation varchar(20),
    primary key(hrid),
    foreign key (hrid) references hrinsurance(hrid));
create table hrdependent(
	hrid int not null,
    dependentid int not null,
    dependentname varchar(40),
    dependentgroupid int,
    dependentdob date,
    dependentrelation varchar(20),
    primary key(hrid,dependentid),
    foreign key(hrid) references hrinsurance(hrid),
    foreign key(dependentgroupid) references dependentgroups(dependentgroupid));
create table hrtopup(
	hrid int not null,
    topupid int,
    foreign key(hrid) references hrinsurance(hrid),
    foreign key(topupid) references cycletopupdetails(topupid));
insert into hr values(1,'varshini',1,0);
insert into hr values(2,'chaitna',1,0);
insert into hr values(3,'sukrita',1,0);
insert into hr values(4,'aishwarya',1,0);
insert into hr values(5,'shah',1,0);
insert into addcycle values(1,1,'2018','Apollo');
insert into addcycle values(2,1,'2019','Andhra');
insert into addcycle values(3,2,'2020','Union');
insert into addcycle values(4,3,'2021','XYXZ');
insert into addcycle values(5,4,'2022','Tamada');
insert into cycletopupdetails values(0,5,0);
insert into cycletopupdetails values(1,5,25000);
insert into cycletopupdetails values(2,5,50000);
insert into cycletopupdetails values(3,5,100000);
insert into cycletopupdetails values(4,5,150000);
insert into bloodgroups values(1,'A+');
insert into bloodgroups values(2,'B+');
insert into bloodgroups values(3,'A-');
insert into bloodgroups values(4,'O+');
insert into bloodgroups values(5,'O-');
insert into maritalstatus values(1,'Married');
insert into maritalstatus values(0,'single');
insert into employee values(1,5,99999999999,1,1);
insert into employee values(2,5,99999998899,2,1);
insert into employee values(3,5,99999977999,1,0);
insert into employee values(4,5,99999669999,3,1);
insert into employee values(5,5,99999559999,5,0);
insert into dependentgroups values(1,'parents/in-laws');
insert into dependentgroups values(2,'spouse');
insert into dependentgroups values(3,'childeren');
insert into dependent values(1,1,1,'1980-08-19','father','suresh');
insert into dependent values(1,2,2,'1999-04-09','husband','abhi');
insert into dependent values(2,1,1,'1985-06-09','mother','madhu');
insert into dependent values(3,1,2,'1998-03-08','husband','jay');
insert into dependent values(5,1,1,'1975-08-13','father','nived');
insert into nominee values(1,'madhu','1985-06-09','mother');
insert into nominee values(2,'suresh','1980-08-19','father');
insert into nominee values(3,'lavanya','1983-04-28','mother');
insert into nominee values(4,'sravya','1990-10-11','sister');
insert into nominee values(5,'tanish','1979-06-29','father');
insert into employeetopup values(1,0);
insert into employeetopup values(2,3);
insert into employeetopup values(3,2);
insert into employeetopup values(4,4);
insert into employeetopup values(5,1);
insert into hrinsurance values(1,"varshini",99999999999,1,1);
insert into hrinsurance values(2,"chaitna" ,99999998899,2,1);
insert into hrinsurance values(3,"sukritha",99999977999,1,0);
insert into hrinsurance values(4,"aishwarya",99999669999,3,1);
insert into hrinsurance values(5,"shah",99999559999,5,0);
insert into hrnominee values(1,'madhu','1985-06-09','mother');
insert into hrnominee values(2,'suresh','1980-08-19','father');
insert into hrnominee values(3,'lavanya','1983-04-28','mother');
insert into hrnominee values(4,'sravya','1990-10-11','sister');
insert into hrnominee values(5,'tanish','1979-06-29','father');
insert into hrdependent values(1,1,'suresh',1,'1980-08-19','father');
insert into hrdependent values(1,2,'abhi',2,'1999-04-09','husband');
insert into hrdependent values(2,1,'madhu',1,'1985-06-09','mother');
insert into hrdependent values(3,1,'jay',2,'1998-03-08','husband');
insert into hrdependent values(5,1,'nived',1,'1975-08-13','father');
insert into hrtopup values(1,0);
insert into hrtopup values(2,3);
insert into hrtopup values(3,2);
insert into hrtopup values(4,4);
insert into hrtopup values(5,1);