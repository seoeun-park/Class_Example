package customer;

import java.util.List;

public interface CustomerService {
	//CRUD (Create, Read, Update, Delete)
	void customer_insert(CustomerVO vo);	//고객 정보 신규 저장
	List<CustomerVO> customer_list();		//고객 목록 조회
	CustomerVO customer_detail(int id);		//고객 상세 조회
	void customer_update(CustomerVO vo);	//고객 정보 변경
	void customer_delete(int id);			//고객 정보 삭제

}
