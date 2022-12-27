create database spring default character set utf8;


create table board (
 seq int primary key
 , title varchar(200)
 , writer varchar(20) not null , content varchar(2000) not null , regdate date default sysdate()
 , cnt int default 0
);
create table users ( 
 id varchar(15) primary key
 , password varchar(20) 
 , name varchar(50)
 , role varchar(10)
); 


DELIMITER //
BEGIN NOT ATOMIC
  declare i int default 1;
   while(i<=1000) do
      insert into users (id, password, name, role) 
              values(concat('user_', LPAD(i,4,0)), '12345', concat('사용자_', LPAD(i,4,0)), "");
      set i = i + 1;
   end while;
END;

insert into users (id, password, name, role) values('admin@gmail.com', '12345', 'administrator', "admin");


