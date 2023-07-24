# 사용자 권한 - dcl
create user test1@localhost identified by '1234';

use mysql;
select host, user from user;

# 권한 빼앗기
revoke all on study3.* from test1@localhost;
# all privileges: 모든 테이블에 대한 모든 권한을 주겠다
grant all privileges on study3.user_tb to test1@localhost;

#어디서든 접근 가능한 test2계정
create user 'test2'@'%' identified by '1234';
use mysql;
select host, user from user;

#비번변경(아래 두개 세트, 변경하고 적용)
alter user 'test2'@'%' identified by '1111';
flush privileges;

alter user 'test1'@'localhost' identified by '1111';
flush privileges;

# 기호 주의(``, '')
grant select, insert on `study3`.`user_tb` to 'test2'@'%';
flush privileges;

revoke insert on `study3`.`user_tb` from 'test2'@'%';
flush privileges;

show grants for 'test2'@'%';


#quiz : '이름'으로 아이디 만들고 @ localhost에서만 접속 가능하게 계정 생성, 비밀번호 1234
# 해당 계정의 비밀번호를 1q2w3e4r로 변경
# 권한은 study2데이터베이스 -> user_tb(select, insert, update, delete),
# update권한 회수
 
# study3 -> product_tb (select)
# delete권한 추가
create user 'yoojung'@localhost identified by '1234';
alter user 'yoojung'@localhost identified by '1q2w3e4r';
flush privileges;
grant select, insert, update, delete on study1.student_tb to 'yoojung'@localhost;
flush privileges;
revoke update on study1.student_tb from 'yoojung'@localhost;
flush privileges;
grant select on study3.product_tb to 'yoojung'@localhost;
grant select, delete on study3.product_tb to 'yoojung'@localhost;
flush privileges;

show grants;