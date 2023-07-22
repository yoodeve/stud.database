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
	odt.product_id,
	count(odt.count_number) as total_sold_amount,
	sum(pt.product_price * odt.count_number) as total_price
from 
	product_tb pt
    left outer join order_detail_tb odt on(pt.product_id = odt.product_id)
group by
	odt.product_id;
    
# 3번  카테고리별 등록된 상품의 count를 조회하시오.
select
	pt.category_id,
    ct.category_name,
	count(pt.product_id) as product_count
from
	category_tb ct
    left outer join product_tb pt on(pt.category_id = ct.category_id)
group by
	ct.category_name,
    pt.category_id; 

# 4번 address_tb sido컬럼을 참조하여 각 지역별로 판매된 상품의 총액을 조회하시오.
select
	at.address_sido,
    ifnull(sum(pt.product_price * odt.count_number), 0) as total_order_price
from 
	address_tb at
	left outer join order_tb ot on(ot.address_id = at.address_id)
    left outer join order_detail_tb odt on(odt.order_id = ot.order_id)
    left outer join product_tb pt on (pt.product_id = odt.product_id)
group by
	address_sido;

# 5번 상품명이 '나이키'가 포함된 제품이 몇개가 판매되었고, 판매된 총액은 얼마인지도 조회하시오.
select
	'나이키' as search_value,
    sum(odt.count_number) as nike_sales_amount,
    sum(pt.product_price * odt.count_number) as total_nike_order_price
from 
	order_detail_tb odt
    left outer join product_tb pt on(pt.product_id = odt.product_id)
where 
	pt.product_name like '%나이키%';
	