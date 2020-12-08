import java.util.ArrayList;

import com.hanul.product.ProductDAO;
import com.hanul.product.ProductDTO;

public class ProductMain {
	public static void main(String[] args) {
		// ��ǰ����(��ǰ��, �ܰ�, �ֹ�����)�� ������ ArrayList<> list ���ѹ迭�� ����
		// ("��ǻ��", 500000, 5) ("������", 100000, 7) ("��Ʈ��", 300000, 5)
		// ("�����", 300000, 5) ("����", 100000, 8)
		// ���ݰ��(getPrice()), ���� �������� ����(priceDescSort()), ���(display())
		// ��ǰ�� �������� ����(nameAscSort()), ���(display())
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		list.add(new ProductDTO("��ǻ��", 500000, 5));
		list.add(new ProductDTO("������", 100000, 7));
		list.add(new ProductDTO("��Ʈ��", 300000, 5));
		list.add(new ProductDTO("�����", 300000, 5));
		list.add(new ProductDTO("����", 100000, 8));
		
		ProductDAO dao = new ProductDAO(list);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
		dao.print();
		
		
	}//main()
}//class
