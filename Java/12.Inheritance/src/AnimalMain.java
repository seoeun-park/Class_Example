import com.hanul.animal.Cat;
import com.hanul.animal.Dog;

public class AnimalMain {
	public static void main(String[] args) {
		Dog dog = new Dog("�۸���", 3);		// Dog ��ü�� �����ϰ� �ʱ�ȭ
		Cat cat = new Cat("�߿���", 2);		// Cat ��ü�� �����ϰ� �ʱ�ȭ
		
		System.out.println("������ �̸� : " + dog.getName() + "\t���� : " + dog.getAge());
		System.out.println("����� �̸� : " + cat.getName() + "\t���� : " + cat.getAge());
		
		dog.setName("�ٵ���");
		dog.setAge(5);
		System.out.println("\n������ �̸� : " + dog.getName() + "\t���� : " + dog.getAge());

		cat.setName("�����");
		cat.setAge(4);
		System.out.println("����� �̸� : " + cat.getName() + "\t���� : " + cat.getAge());
		
		
	}//main()
}//class
