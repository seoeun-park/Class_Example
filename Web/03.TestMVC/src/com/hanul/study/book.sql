-- Book 테이블 생성
create table book(
	title varchar2(30),
	auth varchar2(20),
	isbn varchar2(20) primary key not null,
	comp varchar2(20),
	cost number,
	su number,
	price number
);

select * from book;