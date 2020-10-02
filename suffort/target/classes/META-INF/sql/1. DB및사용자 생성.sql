create database suffort;


use mysql;
select host, user, password from user;


create user 'hoon'@'%' IDENTIFIED by 'zxcv1234';


grant all PRIVILEGES on *.* to 'hoon'@'%';


flush PRIVILEGES;


show grants for 'hoon'@'%';

-- 이후 새 접속 --> 사용자를 '이름'로 입력하고 DATABASE는 suffort로 접속

show databases;
