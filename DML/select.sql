insert into student_tb 
values
	(0, '한유정', 20, 0), 
	(0, '한무정', 21, 0), 
	(0, '한유연', 20, null),  
	(0, '한세연', 22, null),  
	(0, '한무연', 21, 0);

# 지양 : 아스터릭스 쓰는것..
select * from student_tb;

# 지향 : 엔터와 탭을 열심히, 칼럼명은 모두 기재
select 
	student_id,
	student_name,
    student_age,
    student_score
from 
	student_tb
where
	(student_age = 20
    # or student_score = 0
    # null은 = 아님
    # or student_score is null
    or student_score is not null)
    and student_name = '한유정';
    # 논리곱, 논리합의 순서를 잘 생각해야함, 괄호를 활용하거나 순서를 잘 짜야함

update student_tb
set
	student_score = 30
where
	student_age = 22;

# 쿼리문법 순서 주의(where은 group by 이전)
# 나이가 20살인 학생들의 점수를 전부 더하세요.
select
	student_age,
    # alias와 자바 클래스 엔티티객체 내의 변수명을 일치시키기
    sum(student_score) as total_score
from
	student_tb
-- where group by 이전의 조건 주기
-- 	student_age = 20
 group by
 	student_age
having # group by 이후의 조건 주기
	total_score = 40;

# 행의 갯수
select 
	count(*)
from 
	student_tb
where 
	student_age = 20;

# 쿼리문의 실행순서 : from - where - group by - select - having - order by
select
	* 
from
	student_tb
order by
	student_score desc,
	student_id desc;