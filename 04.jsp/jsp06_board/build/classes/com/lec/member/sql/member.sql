create database member;

drop table member;

create table member (
	
	  member_id 		varchar(15) primary key
	, member_pw			varchar(13) 
	, member_name  		varchar(20)
	, member_age	    int
	, member_gender		varchar(5)
	, member_email		varchar(30)
	
);



DELIMITER //
BEGIN NOT ATOMIC
    declare i int default 1;
	while(i<=101) do
		insert into member ( member_id , member_pw, member_name, member_age, member_gender, member_email) 
				    values (concat('아이디_', LPAD(i,'3','0')), '1', concat('이름_', i) , 32 , '남자' , concat('이메일_', i));
		set i = i + 1;
	end while;
END;



select count(*) from member;

select * from member order by board_num desc limit 0, 10;