import java.util.ArrayList;

public class ArrayListMain05 {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		list.add(new String("AAA"));
		list.add("BBB");
		list.add("CCC");
		System.out.println(list);
		
		list.add(1, "DDD");			//index ��ġ�� ���� ����ǰ�, ���� ���� �ִٸ� ���� ���� �ڷ� �̵��ȴ�.
		System.out.println(list);
		
		list.set(1, "EEE");			//index ��ġ ���� ���� : set()
		System.out.println(list);
		
		list.remove(1);				//index ��ġ ���� �����ǰ� ���� ������ ������ �̵�
		System.out.println(list);
		
		list.removeAll(list);		//list ��ü ���� ����
		System.out.println(list);
		
	}//main()
}//class
