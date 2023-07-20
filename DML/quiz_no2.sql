/*
	(뭘 하든 하나의 select(sub ok) 안에서 결과를 낼 것)
	1. 검색창에 상구라고 검색했을 때 해당 user에 등록된 모든 주소를 조회하시오.
    2. 상품별 총 판매 수량, 판매 총액을 조회하시오.
    3. 카테고리별 등록된 상품의 count를 조회하시오.
    4. address_tb sido컬럼을 참조하여 각 지역별로 판매된 상품의 총액을 조회하시오.
	5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매되었고, 판매된 총액은 얼마인지도 조회하시오.
*/
# 1번
select 
    name,
	address
from 
	address_tb at
    left outer join user_tb ut on(at.user_id = ut.user_id)
where 
	ut.name = '상구';
	
# 2번
select
	ct.category_name,
	count(ct.category_id * odt.count_number) as total_sold_amount,
	sum(ct.category_id*pt.product_price) as total_price
from 
	product_tb pt
	left outer join category_tb ct on(pt.category_id = ct.category_id)
    left outer join order_detail_tb odt on(pt.product_id = odt.product_id)
group by
	ct.category_id;
    
# 3번  카테고리별 등록된 상품의 count를 조회하시오.
select
    ct.category_name,
	count(pt.product_id) as product_count
from
	category_tb ct
    left outer join product_tb pt on(pt.category_id = ct.category_id)
group by
	ct.category_id;

# 4번 address_tb sido컬럼을 참조하여 각 지역별로 판매된 상품의 총액을 조회하시오.
select
	sum(pt.product_price) as total_sold_price,
    at.address_sido
from 
	address_tb at
	left outer join order_tb ot on(ot.address_id = at.address_id)
    left outer join user_tb ut on(ut.user_id = ot.user_id)
    left outer join order_detail_tb odt on(odt.order_id = ot.order_id)
    left outer join product_tb pt on (pt.product_id = odt.product_id)
group by
	address_sido;

# 5번 상품명이 '나이키'가 포함된 제품이 몇개가 판매되었고, 판매된 총액은 얼마인지도 조회하시오.
select
	sum(pt.product_price) as nike_price_amount,
	count(pt.product_name like '%나이키%') as nike_amount
from 
	order_detail_tb odt
	left outer join order_tb ot on(ot.order_id = odt.order_id)
    left outer join product_tb pt on(pt.product_id = odt.product_id)
group by
	pt.product_name;