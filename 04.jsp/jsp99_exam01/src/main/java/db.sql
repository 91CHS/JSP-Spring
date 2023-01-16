drop table member_tbl_02;

create table member_tbl_02 (
	custno  number(6) primary key
  , custname varchar2(20)
  , phone varchar2(13)
  , address varchar2(60)
  , joindate date default sysdate
  , grade char(1)
  , city  char(12)
);

insert into member_tbl_02 values(100001, '김행복', '010-1111-1111', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 values(100002, '이축목', '010-1111-2222', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_02 values(100003, '장믿음', '010-1111-3333', '울릉군 을릉읍 독도1리', '20151202', 'B', '30');
insert into member_tbl_02 values(100004, '최사랑', '010-1111-4444', '울릉군 을릉읍 독도2리', '20151113', 'A', '30');
insert into member_tbl_02 values(100005, '진평화', '010-1111-5555', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_tbl_02 values(100006, '차공단', '010-1111-6666', '제주도 제주시 감나무골', '20151211', 'C', '60');

commit;

drop table money_tbl_02;
create table money_tbl_02 (
	custno  number(6)
  , salenol  number(8)
  , pcost number(8)
  , amount number(4)
  , price number(8)
  , pcoce varchar2(4)
  , sdate date
  , primary key(custno, salenol)
);

insert into money_tbl_02 values(100001, 2016001, 500,  4, 2500, 'A001', '20160101');
insert into money_tbl_02 values(100001, 2016002, 1000, 5, 4000, 'A002', '20160101');
insert into money_tbl_02 values(100001, 2016003, 500,  3, 1500, 'A008', '20160101');
insert into money_tbl_02 values(100002, 2016004, 2000, 1, 2000, 'A004', '20160102');
insert into money_tbl_02 values(100002, 2016005, 500,  1, 500,  'A001', '20160103');
insert into money_tbl_02 values(100003, 2016006, 1500, 2, 3000, 'A003', '20160103');
insert into money_tbl_02 values(100004, 2016007, 500,  2, 1000, 'A001', '20160104');
insert into money_tbl_02 values(100004, 2016008, 300,  1, 300,  'A005', '20160104');
insert into money_tbl_02 values(100004, 2016010, 600,  1, 600,  'A006', '20160104');
insert into money_tbl_02 values(100004, 2016001, 3000, 1, 3000, 'A007', '20160105');

commit;
