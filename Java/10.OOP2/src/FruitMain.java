import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class FruitMain {
	public static void main(String[] args) {
		// 5개의 과일 정보를 저장할 객체배열(fruit[])을 선언 및 생성하고 초기화
		// 딸기, 8000, 21
		// 귤, 15000, 2
		// 수박, 10000, 10
		// 바나나, 5000, 10
		// 복숭아, 20000, 2
		// 가격 계산(getPrice()), 가격 내림차순 정렬(priceDesSort()), 출력(display())
		FruitDTO[] fruit = new FruitDTO[5];
		
		fruit[0] = new FruitDTO("딸기", 8000, 21);
		fruit[1] = new FruitDTO("귤", 15000, 2);
		fruit[2] = new FruitDTO("수박", 10000, 10);
		fruit[3] = new FruitDTO("바나나", 5000, 10);
		fruit[4] = new FruitDTO("복숭아", 20000, 2);
		
		FruitDAO dao = new FruitDAO(fruit);
		dao.getPrice();
		dao.priceDesSort();
		dao.display();
		
	}//main()
}//class
