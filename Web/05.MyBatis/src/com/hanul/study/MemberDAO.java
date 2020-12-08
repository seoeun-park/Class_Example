package com.hanul.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	// 기존 JDBC 모델에서는 Connection(DB 연결)을 먼저 만들었지만,
	//myBatis 경우 SqlSessionFactory 객체를 먼저 생성
	private static SqlSessionFactory sqlMapper;
	
	// static(초기화 블럭 : 가장 먼저 실행되는 코드)
	static {
		String resource = "com/hanul/mybatis/SqlMapConfig.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception");
		}
	}//static
	
	//회원 가입
	public int memberInsert(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		// → SqlSessionFactory(sqlMapper)에서 SqlSession session 활성화
		
		int succ = 0;
		
		succ = session.insert("memberInsert", dto);		
		// → SQL insert 쿼리 : memberMapper.xml
		
		session.commit();	//커밋
		session.close(); 	//session 비활성화
		
		return succ;
	}//memberInsert()
	
	// 전체 회원 검색
	public List<MemberDTO> memberSearchAll() {
		 SqlSession session = sqlMapper.openSession();
		 
		 List<MemberDTO> list = null;
		 // List<> → ArrayList<>를 대신
		 
		 list = session.selectList("memberSearchAll");
		 // → SQL select 쿼리 : memberMapper.xml
		 // selectList → 검색된 결과가 몇 개가 나올지 모를 때
		 // selectOne → 검색된 결과가 하나가 나올 떼
		 
		 session.close();
		 
		 return list;
	}//memberSearchAll()
	
	// 회원 정보 삭제
	public int memberDelete(String id) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.delete("memberDelete", id);
		session.commit();
		session.close();
		
		return succ;
	}//memberDelete()
	
	// ID 검색
	public MemberDTO getById(String id) {
		SqlSession session = sqlMapper.openSession();
		
		MemberDTO dto = null;
		dto = session.selectOne("getById", id);
		// → 검색된 결과가 하나이므로
		// → SQL select 쿼리 : memberMapper.xml
		session.close();
		
		return dto;
	}//getById()
	
	// 회원 정보 수정하기
	public int memberUpdate(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.update("memberUpdate", dto);
		session.commit();
		session.close();
		
		return succ;
	}//memberUpdate()
}//class
