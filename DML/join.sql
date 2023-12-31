insert into product_tb
values
	(0, '상의1', 10000),
	(0, '상의2', 20000),
	(0, '상의3', 30000);
    
select * from product_tb;

insert into product_color_tb
values
	(0, 'black'),
	(0, 'white'),
	(0, 'red'),
	(0, 'blue'),
	(0, 'green');
select * from product_color_tb;

insert into registered_product
# 인덱스로 조합
values
	(0, 1, 1),
	(0, 1, 2),
	(0, 1, 3),
	(0, 1, 4),
	(0, 1, 5),
	(0, 2, 1),
	(0, 2, 3),
	(0, 3, 2),
	(0, 3, 4);
    
select 
	*,
    (select color_name 
     from product_color_tb as pct 
     # 두 테이블 모두 product_color_id가 있으므로 헷갈리지 않게 별칭처리(본명으로 참조해도 상관무)
	 where pct.product_color_id = rpt.product_color_id) as color_name
from 
	registered_product as rpt
where
	product_color_id = (select
							product_color_id
						from 
							product_color_tb
						where 
							color_name = 'black');
                            
select 
	* 
from
	registered_product rpt
    # 차집합 outer, 교집합 inner
    left outer join product_color_tb pct on(pct.product_color_id = rpt.product_color_id)
where
	pct.color_name = 'red';
    
select
	product_color_id
from 
	product_color_tb
where 
	color_name = 'red';

