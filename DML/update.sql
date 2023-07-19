# update(수정)
select * from test_tb;
update test_tb set name = '구유정' where test_id = 8;
update test_tb set birthday = '1995-06-10' where test_id = 6;
update test_tb set birthday = '1995-07-10' where test_id = 7;

update test_tb set name = '십유정', birthday = '1995-10-10' where test_id = 1;