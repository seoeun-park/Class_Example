import java.util.ArrayList;

import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class FruitMain {
	public static void main(String[] args) {
		//과일정보(FruitDTO)를 저장할 ArrayList<>에 저장하시오.
		ArrayList<FruitDTO> list = new ArrayList<>();
		
		list.add(new FruitDTO("복숭아", 2000, 24));
		list.add(new FruitDTO("풋사과", 1000, 22));
		list.add(new FruitDTO("바나나", 3500, 10));
		list.add(new FruitDTO("체리", 5000, 15));
		list.add(new FruitDTO("자두", 2000, 30));
		
		//가격을 계산하고(getPrice()), 가격의 내림차순으로 정렬(priceDescSort())
		//출력(display())하시오. 
		//단, FruitDAO 클래스 설계시 list를 전달받는 생성자 메소드를 구현하시오.
		FruitDAO dao = new FruitDAO(list);
		dao.getPrice();
		dao.priceDesSort();
		dao.display();
		
	}//main()
}//class
