select * from test_tb;
# insert구문 : 데이터 추가
# 백팃을 생략할수도 있으나, 생략하지 않을 시 예약어들이 폰트스타일이 다른데
# 예약어가 아닌데 예약어처럼 보이는 경우 구분을 위해 사용하고, 생략이 통상적
insert into study1.test_tb(test_id, name, birthday) values(3, '세유정', '1995-03-10');
insert into study1.test_tb(`test_id`, `birthday`, `name`) values(4, '1995-04-10', '네유정');
insert into study1.test_tb(test_id, birthday, name) values(5, '1995-05-10', '닷유정');
# 칼럼 명시는 생략이 가능하나, value 입력 순서를 칼럼 순서와 동일하게 기입해야 함
insert into test_tb values(6, '엿유정', '1995-05-10');
# 생일은 null로 입력됨
insert into test_tb(test_id, name) values(7, '칠유정');
# 칼럼명 생략시엔 순서대로 기입하고, 빈자리는 null 명시
insert into test_tb values(8, null, '1995-08-10');