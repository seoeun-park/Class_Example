import java.util.Arrays;

public class Test_String {
	// �־��� ���ڿ�(str)�� @�� �������� ���ڿ��� �и��ϰ� �����ϴ� �޼ҵ�(strSplit()) ȣ�� 
	// ����ϴ� �޼ҵ�(display()) �޼ҵ� ȣ��
	// ���ϸ��� ������������ �����ϴ� �޼ҵ�(fruitNameDescSort())
	// ����ϴ� �޼ҵ�(display()) �޼ҵ� ȣ��
	
	public static void main(String[] args) {
		String str = "���@������@û����@�ڸ�@�θ���";
		
		String[] result = strSplit(str);
		
		System.out.print("���� �� : ");
		display(result);
		fruitNameDescSort(result);
		System.out.print("���� �� : ");
		display(result);
	}//main
	
	// ���ڿ��� �и��ϰ� �����ϴ� �޼ҵ� ����
	public static String[] strSplit(String str) {
		String[] str1 = str.split("@");
		return str1;
		//return str.split("@");
	}//strSplit()
	
	// ��� �޼ҵ� ����
	public static void display(String[] strs) {
		System.out.println(Arrays.toString(strs));
	}//display()
	
	// ���ϸ��� ������������ �����ϴ� �޼ҵ� ����
	public static void fruitNameDescSort(String[] strs) {
		for (int i = 0; i < strs.length; i++) {
			for (int j = i + 1; j < strs.length; j++) {
				if (strs[i].compareTo(strs[j]) < 0) {
					String temp = strs[i];
					strs[i] = strs[j];
					strs[j] = temp;
				}
			}//for j
		}//for i
	}//fruitNameDescSort()
}//class
