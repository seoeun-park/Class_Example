--테이블 생성
create table boardMember(
	Member_id varchar2(15) primary key not null,
	Member_pw varchar2(15),
	Member_name varchar2(15),
	Member_age number,
	Member_gender varchar2(5),
	Member_email varchar2(30)
);

-- 전체 레코드 검색
select * from BOARDMEMBER;