import java.util.ArrayList;

import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class FruitMain {
	public static void main(String[] args) {
		//��������(FruitDTO)�� ������ ArrayList<>�� �����Ͻÿ�.
		ArrayList<FruitDTO> list = new ArrayList<>();
		
		list.add(new FruitDTO("������", 2000, 24));
		list.add(new FruitDTO("ǲ���", 1000, 22));
		list.add(new FruitDTO("�ٳ���", 3500, 10));
		list.add(new FruitDTO("ü��", 5000, 15));
		list.add(new FruitDTO("�ڵ�", 2000, 30));
		
		//������ ����ϰ�(getPrice()), ������ ������������ ����(priceDescSort())
		//���(display())�Ͻÿ�. 
		//��, FruitDAO Ŭ���� ����� list�� ���޹޴� ������ �޼ҵ带 �����Ͻÿ�.
		FruitDAO dao = new FruitDAO(list);
		dao.getPrice();
		dao.priceDesSort();
		dao.display();
		
	}//main()
}//class
