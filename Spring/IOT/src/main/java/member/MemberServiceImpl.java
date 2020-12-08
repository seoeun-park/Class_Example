package member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Override
	public boolean member_insert(MemberVO vo) {
		
		return dao.member_insert(vo);
	}
	
	@Autowired private MemberDAO dao;

	@Override
	public MemberVO member_login(HashMap<String, String> map) {

		return dao.member_login(map);
	}

	@Override
	public boolean member_update(MemberVO vo) {

		return false;
	}

	@Override
	public boolean member_delete(String userid) {

		return false;
	}

	@Override
	public boolean member_id_check(String userid) {

		return dao.member_id_check(userid);
	}

}
