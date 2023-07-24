# 1. 각 계정별 어떤 기부를 했는지 조회하시오
select 
	giver_id,
    sum(giving_total)
from 
	giver_tb
group by
	giver_id;
    
# 2. 센터별로 총 기부액이 얼마인지 조회하시오
select
	center_name,
    sum(giving_total)
from
	giver_tb gt
	left outer join user_tb ut on(gt.user_id = ut.user_id)
	left outer join giving_page_tb gpt on(gpt.giving_page_id = gt.giving_page_id)
    left outer join center_tb ct on(gpt.center_id = ct.center_id)
group by
	center_name;
    
# 3. 기부 항목별 총 기부액을 조회하시오
select
	giving_name,
	sum(giving_total)
from
	giver_tb gt
    left outer join giving_page_tb gpt on(gpt.giving_page_id = gt.giving_page_id)
group by
	giving_name;

# 4. 카테고리별 총 기부액을 조회하시오.
select
    giving_category_name,
    giving_category_id,
	sum(giving_total)
from
	giver_tb gt
    left outer join giving_page_tb gpt on(gpt.giving_page_id = gt.giving_page_id)
    left outer join giving_category_tb gct on(gpt.category_id = gct.giving_category_id)
group by
	giving_category_id;