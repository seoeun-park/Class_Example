public class Operator08 {
	public static void main(String[] args) {
		// ���α׷����� ���Ǵ� Ư�� ��ȣ����(Escape Sequence) : ��¹��� ���� ���
		// cmd â���� �����ؾ� ��Ȯ�� ����� ���´�!(d: �Է� �� "cd �ּ�" �Է� �� "java ���ϸ�" �Է�)
		// ��������(\)�� ���� �Է��ϰ� ����Ѵ�.
		// �� �� ���� ���� �̽������� ����,		�� �� ��Ŭ������ �ܼ�â�� cmd â�� ����� �ٸ� �̽������� ����
		System.out.println("1. Hello World");
		System.out.println("2. Hello" + "\t" + "World");	// \t : �� ����(8ĭ �������)  ��
		System.out.println("3. Hello\tWorld");				// ���ڿ� ��¹� �ȿ� �����Ͽ� ��밡��
		System.out.println("4. Hello" + "\n" + "World");	// \n : �ٹٲ�(���� : new line) ��
		System.out.println("5. Hello" + "\b" + "World");	// \b : �齺���̽�(�տ� �� ���ڸ� ����) ��
		System.out.println("6. Hello" + "\r" + "World");	// \r : Carriage Return(���� ó������ Ŀ���� �̵�) ��
		// 6. Hello �� �̶� r�� �����鼭 ���� ó������ �̵��Ǹ鼭 ����
		// Worldllo �� '6'��� 'W', '.'��� 'o'...'e'��� 'd'���� ���ٰ� ������ ���ڴ� �״�� �Է� 
		
		System.out.println("7. Hello" + "\"" + "World");	// \" : �ֵ���ǥ�� ǥ�� ��
		System.out.println("8. Hello" + "\'" + "World");	// \' : ���� ����ǥ�� ǥ�� ��
		System.out.println("9. Hello" + "\\" + "World");	// \\ : \(��������, root) ǥ�� ��
		// System.out.println("��ȣ" + "�̸�" + "��ȭ��ȣ");
		System.out.println("��ȣ" + "\t" + "�̸�" + "\t" + "��ȭ��ȣ");
		System.out.println("001" + "\t" + "ȫ�浿" + "\t" + "010-1111-1111");
		System.out.println("002" + "\t" + "����" + "\t" + "010-2222-2222");
		
	} //main()
} //class
