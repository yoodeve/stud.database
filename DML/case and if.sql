# 조건문
select 
	*,
    # when, then 여러개 삽입 가능(if, else 문)
    case
		when product_price < 100000 then '10만원 미만'
        when product_price < 200000 then '20만원 미만'
        else '20만원 이상'
    end as '가격 범위',
    # 삼항연산자
    if(product_price < 100000, '10만원 미만', '10만원 이상') as '가격 범위2',
    if(size_m is null, '사이즈 없음', size_m) as size_m2,
    ifnull(size_m, '') as size_m3, # null체크 전용, null인경우 인자2를 대입
	nullif(size_m, "M") as size_m4, # 인자2와 행의 데이터값이 일치하면 null로 바꿈, null도 null로 남아있음
    if(soldout_flag = 1, '품절', '판매중') as '품절여부'
from
	product_tb;