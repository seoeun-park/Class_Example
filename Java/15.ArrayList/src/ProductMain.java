import java.util.ArrayList;

import com.hanul.product.ProductDAO;
import com.hanul.product.ProductDTO;

public class ProductMain {
	public static void main(String[] args) {
		// 제품정보(제품명, 단가, 주문수량)를 저장할 ArrayList<> list 무한배열을 생성
		// ("컴퓨터", 500000, 5) ("프린터", 100000, 7) ("노트북", 300000, 5)
		// ("모니터", 300000, 5) ("헤드셋", 100000, 8)
		// 가격계산(getPrice()), 가격 내림차순 정렬(priceDescSort()), 출력(display())
		// 제품명 오름차순 정렬(nameAscSort()), 출력(display())
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		list.add(new ProductDTO("컴퓨터", 500000, 5));
		list.add(new ProductDTO("프린터", 100000, 7));
		list.add(new ProductDTO("노트북", 300000, 5));
		list.add(new ProductDTO("모니터", 300000, 5));
		list.add(new ProductDTO("헤드셋", 100000, 8));
		
		ProductDAO dao = new ProductDAO(list);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
		dao.print();
		
		
	}//main()
}//class
