-- Eclipse와 DB연동 시 오류 발생할 때 해결 방법
-- D:\Study_Web\workspace\.metadata\.plugins\org.eclipse.datatools.sqltools.result
-- 위의 폴더 안의 파일 모두 삭제

--테이블 생성
create table tblBoard(
	b_num number primary key not null,
	b_subject varchar2(50),
	b_pwd varchar2(20),
	b_content varchar2(2000),
	b_writer varchar2(20),
	b_date varchar2(20),
	b_readcount number
);

-- 전체 레코드 검색
select * from tblBoard order by b_num desc;

--자동 증가값을 설정 : b_num → b_num seq 변수를 만들어 변수값이 자동으로 올라가게끔 설정
create sequence b_num_seq start with 1;

--임의의 레코드 삽입
insert into tblBoard values(b_num_seq.nextval, 'subject', 'pwd', 'content',
							'writer', sysdate, 0);
							
--전체 레코드 삭제
delete from tblBoard;

--테이블 삭제
drop table tblBoard;
-- 테이블을 삭제 시키더라도 sequence는 아직도 남아있음
-- 테이블을 삭제되거나 데스크톱이 셧다운이 된다면, sequence에 insert를 하게 되면 21부터 시작
-- sequence는 20을 단위로 새로 시작하기 때문

--자동 증가 값 삭제
drop sequence b_num_seq;

commit;

