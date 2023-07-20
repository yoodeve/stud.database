# like
select 
	*
from
	product_tb
# %는 와일드카드와 비슷한 격(사용 주의) - 문자열 전용
# _는 한 언더스코어당 한 character
where
	-- product_name like '%ST%'
    -- or product_name like 'BASIC _T?SSY TEE'; 
# like를 써서 N으로 시작하거나 Property로 시작하는 경우 : like는 in과 동시에 사용 x
    -- product_name in('NO.4 TEE', 'PROPERTY OF TEE');
    product_name like 'NO%'
    or product_name like 'PROPERTY%'
    ;