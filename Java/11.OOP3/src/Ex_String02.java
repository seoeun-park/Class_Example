public class Ex_String02 {
	// ���ڿ��� ��Ұ��� �� : compareTo(), compareToIgnoreCase()
	// ���ڿ��� ������� �� : equals(), equalsIgnoreCase()
	public static void main(String[] args) {
		String str1 = "APPLE";
		String str2 = "ORANGE";
		String str3 = "APPLE";
		String str4 = "apple";
		
		// if (str1 > str2) 	��   ���� : ���ڿ��� ��Ұ���� �� �����ڸ� ����� �� ����. 
		// ���ڿ��� �񱳴� �����ڵ� ������ ���Ѵ�. 	��   compareTo()
		// compareTo() ��� : ���, 0, ����
		int result = str1.compareTo(str2);
		System.out.println(result);					// -14(����) : str2�� �� ũ��.
		
		result = str1.compareTo(str3);
		System.out.println(result);					// 0 : str1�� str2�� ����.
		
		result = str4.compareTo(str1);
		System.out.println(result);					// 32(���) : str4�� �� ũ��.
		
		result = str1.compareToIgnoreCase(str4);	// ��ҹ��� ���о��� ��
		System.out.println(result);					// 0 : str1�� str4�� ����.
		
		// ���� ���踦 �Ǵ� : if(str1.compareTo(str3) == 0) > equals() : true, false ��ȯ    
		if (str1.compareTo(str3) == 0) {
			System.out.println(str1 + "��(��) " + str3 + "��(��) ����." );
		} else {
			System.out.println(str1 + "��(��) " + str3 + "��(��) ���� �ʴ�." );			
		}
		
		if (str1.equals(str3)) {
			System.out.println(str1 + "��(��) " + str3 + "��(��) ����." );
		} else {
			System.out.println(str1 + "��(��) " + str3 + "��(��) ���� �ʴ�." );			
		}
		
		if (str1.equals(str2)) {
			System.out.println(str1 + "��(��) " + str2 + "��(��) ����." );
		} else {
			System.out.println(str1 + "��(��) " + str2 + "��(��) ���� �ʴ�." );			
		}
		
		if (str1.equals(str4)) {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ����." );
		} else {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ���� �ʴ�." );			
		}
		
		if (str1.equalsIgnoreCase(str4)) {			// ��ҹ��� ���� ���� ���� ���踦 ��
			System.out.println(str1 + "��(��) " + str4 + "��(��) ����." );
		} else {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ���� �ʴ�." );			
		}
				
	}//main()
}//class
