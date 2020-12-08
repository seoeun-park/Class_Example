package customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO implements CustomerService{
	@Autowired private SqlSession sql;
	
	@Override
	public void customer_insert(CustomerVO vo) {
		sql.insert("customer.mapper.insert", vo);
		// mapper 파일명.태그명
		// vo를 넘겨주는 이유? 화면에서 등록된 데이터들을 가져와 DB에 저장하기 위해서
	}

	@Override
	public List<CustomerVO> customer_list() {
		return sql.selectList("customer.mapper.list");
	}

	@Override
	public CustomerVO customer_detail(int id) {
		return sql.selectOne("customer.mapper.detail", id);
	}

	@Override
	public void customer_update(CustomerVO vo) {
		sql.update("customer.mapper.update", vo);
	}

	@Override
	public void customer_delete(int id) {
		sql.delete("customer.mapper.delete", id);
	}

}
