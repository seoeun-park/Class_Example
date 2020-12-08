--테이블 생성
create table memberBoard(
	Board_num number primary key not null,
	Board_id varchar2(15),
	Board_subject varchar2(50),
	Board_content varchar2(2000),
	Board_file varchar2(20),
	Board_re_ref number,
	Board_re_lev number,
	Board_re_seq number,
	Board_readcount number,
	Board_date date
);

--전체 레코드 검색
select * from memberBoard;

--제약 조건 설정
alter table memberBoard
	add constraint pk_board_id foreign key(Board_id)
		references boardMember(Member_id);
				