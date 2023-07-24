insert into product_tb
values
	(20230701, '상품1'),
	(20230702, '상품2'),
	(20230703, '상품3'),
	(20230704, '상품4'),
	(20230705, '상품5');

create view product_view as 
	select
		*
	from
		product_tb;
    
create index product_code_index on product_tb(product_code);

show index from user_tb;

show full tables in study3 where table_type = 'VIEW'; #데이터베이스의 만들어져있던 뷰만 조회시 사용
show full tables in study3; #테이블 정보 모두 조회
show tables; # 해당 db의 모든 테이블과 뷰를 조회