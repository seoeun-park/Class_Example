import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class FruitMain {
	public static void main(String[] args) {
		// 5���� ���� ������ ������ ��ü�迭(fruit[])�� ���� �� �����ϰ� �ʱ�ȭ
		// ����, 8000, 21
		// ��, 15000, 2
		// ����, 10000, 10
		// �ٳ���, 5000, 10
		// ������, 20000, 2
		// ���� ���(getPrice()), ���� �������� ����(priceDesSort()), ���(display())
		FruitDTO[] fruit = new FruitDTO[5];
		
		fruit[0] = new FruitDTO("����", 8000, 21);
		fruit[1] = new FruitDTO("��", 15000, 2);
		fruit[2] = new FruitDTO("����", 10000, 10);
		fruit[3] = new FruitDTO("�ٳ���", 5000, 10);
		fruit[4] = new FruitDTO("������", 20000, 2);
		
		FruitDAO dao = new FruitDAO(fruit);
		dao.getPrice();
		dao.priceDesSort();
		dao.display();
		
	}//main()
}//class
