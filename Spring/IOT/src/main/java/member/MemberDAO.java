package member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberService {

	@Override
	public boolean member_insert(MemberVO vo) {

		return sql.insert("member.mapper.join", vo) > 0 ? true : false;
	}
	
	@Autowired private SqlSession sql;
	

	@Override
	public MemberVO member_login(HashMap<String, String> map) {

		return sql.selectOne("member.mapper.login", map);
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
		
		return (Integer) sql.selectOne("member.mapper.id_check", userid) > 0 ? false : true;
	}

}
