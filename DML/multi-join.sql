# 1. order_detail_tb + order_tb
select 
	*
from 
	order_detail_tb;
    
select 
	*
from 
	order_tb;
# 2. user_tb에 들어있는 name이 상구인 사람의 구매 총액을 조회하시오.
select 
	ut.name,
	sum(pt.product_price * odt.count_number) as total_order_price
from 
	order_detail_tb odt
    left outer join product_tb pt on(pt.product_id = odt.product_id)
    left outer join order_tb ot on(odt.order_id = ot.order_id)
    left outer join user_tb ut on(ot.user_id = ut.user_id)
    left outer join address_tb at on(at.address_id = ot.address_id)
where 
	ut.name = '상구'
group by
	ut.name;
	
# 2023.06.01 ~ 2023.06.07 까지의 카테고리별 총 판매수량
select
	ct.category_name,
	sum(odt.count_number) as total_order_stock
from 
	order_detail_tb odt
    left outer join product_tb pt on(pt.product_id = odt.product_id)
    left outer join category_tb ct on(ct.category_id = pt.category_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
where 
 	ot.order_date between '2023-06-01' and '2023-06-07'
group by 
	ct.category_id;