package member;

import java.util.HashMap;

public interface MemberService {
	boolean member_insert(MemberVO vo);	//회원가입시 회원정보 저장
	MemberVO member_login(HashMap<String, String> map);		//로그인 처리
	// 로그인 정보를 보다 빨리 찾기 위해 사용하는 것이 Map →  HashMap<key의 parameter, data의 parameter>
	boolean member_update(MemberVO vo);		//마이페이지에서 회원정보 수정
	boolean member_delete(String userid);	//회원탈퇴처리
	boolean member_id_check(String userid);	//아이디 중복확인
	
}
