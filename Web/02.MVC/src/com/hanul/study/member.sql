-- Eclipse와 DB 연동이 안될 경우에는
-- D:\Study_Web\workspace\.metadata\.plugins\org.eclipse.datatools.sqltools.result
-- 폴더 안의 모든 파일을 삭제한 후, Eclipse Restart

--테이블 생성
create table member(
	name varchar2(20),
	id varchar2(20),
	pw varchar2(20),
	age number,
	addr varchar2(50),
	tel varchar2(20)
);

--전체 레코드 검색
select * from member;
