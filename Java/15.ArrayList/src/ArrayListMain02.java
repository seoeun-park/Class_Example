import java.util.ArrayList;

import com.hanul.array.Test;

public class ArrayListMain02 {
	public static void main(String[] args) {
		// ArrayList<> ���� �迭 ��ü ����(list1) �� Object : ��� ��ü(Ŭ����)�� �� ����
		ArrayList<Object> list1 = new ArrayList<>();	// ��ü ���� ��(����x) Element Ÿ���� ���� ����
		//list1.add(100);		// Element(���)�� �ݵ�� Ŭ����(��ü) Ÿ�Ը� ����
		list1.add(new Integer(100));
		list1.add(new String("JAVA"));
		list1.add(new Test());
		
		// list1�� ����(��)�� ��� �Ǵ� ������ ��ü(Test.java)�ȿ� �ִ� �޼ҵ带 ȣ��
		for (int i = 0; i < list1.size(); i++) {
			// ���� �ڷ����� ��ü�� �����Ǿ��� ��� Object Type�� ���
			Object obj = list1.get(i);				// list1�� i��° index ���� �����´�. : Object Type
			if(obj instanceof Integer) {			// obj�� Ÿ���� Integer Ÿ�԰� ��ġ�ϴ� ��
				System.out.println((Integer)obj);	// Integer Ÿ������ Casting
			} else if(obj instanceof String) {		// obj�� Ÿ���� String Ÿ�԰� ��ġ�ϴ� ��
				System.out.println((String)obj);	// String Ÿ������ Casting
			} else if(obj instanceof Test) {		// obj�� Ÿ���� Test Ÿ�԰� ��ġ�ϴ� ��
				((Test)obj).display();				// Test Ÿ������ Casting �� �� �޼ҵ� ȣ��
			}//if
		}//for
		
		//============================================================================
		
		// ArrayList<> ��ü ����(list2) : �� Ư�� Ŭ����(Test.java)�� �����ϱ� ���� Ÿ���� ����
		ArrayList<Test> list2 = new ArrayList<>();		// ���� �� Element ��Ҹ� �����Ѵ�.
		list2.add(new Test());
		//list2.add(new Integer(100));		// ���� : ���� �� ������ Ÿ�԰� �ٸ��� ������
		
		list2.get(0).display();		// Ÿ���� �����Ǿ� �ֱ� ������ Casting�� �ʿ����� x
		
	}//main()
}//class
