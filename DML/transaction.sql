select @@autocommit;
# 오토커밋을 안해주고 transaction에서 commit을 해줘야 저장됨
set autocommit = 0; # commit off

start transaction; # 쿼리문 묶음
savepoint insert_user;
insert into user_tb
values(0, 'eee', '1234');
savepoint update_user_password;
update user_tb set password = '1111' where username = 'eee';
rollback to savepoint update_user_password; #특정지점으로까지만 롤백
rollback to savepoint insert_user;
rollback; # 세이브포인트 무시하고 제일 처음인start transaction 이전으로 돌아감
commit; #여기까지 내용을 db에 적용하겠다! 커밋하면 롤백 안됨. 커밋전에 롤백해아함.

select * from user_tb;

select version();