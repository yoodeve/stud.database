insert into user_mst
values
	(0, 'John', 'John@gmail.com'),
	(0, 'Jane', 'Jane@gmail.com'),
	(0, 'Jim', 'Jim@gmail.com');
insert into user_dtl
values
	(0, '010-1111-2222', 'male'),
	(0, '010-3333-4444', 'female'),
	(0, '010-5555-6666', 'male');
SELECT *
    FROM user_mst um
    left outer join user_dtl ud on(um.user_id = ud.user_id)
where
	username = 'John';

CALL FIND_USER_BY_USERNAME('John');