import com.hanul.poly01.Animal;
import com.hanul.poly01.Cat;
import com.hanul.poly01.Dog;

public class Poly01Main01 {
	// Dog ��ü�� �����ϰ� cry() �޼ҵ带 ȣ��
	public static void main(String[] args) {
		
		// ��Ȳ 1 : Dog Ŭ������ �ڽ��� ���� �������.
		// Dog Ŭ���� �ȿ� ���� ������ �ְ�, �� ������ ��� ������ �Ǵ� �� �˰� �ִ�.
		Dog dog = new Dog();		// ��ü ���� : �Ϲ������� ��ü�� �����ϴ� ���  ��  A a = new A();
		dog.cry();
		
		// ��Ȳ 2 : Dog Ŭ������ �ٸ� ����� ���� ������ �־���(Dog.class) 
		//		  �� .java�� �ƴ� .class�� ��� ���� ��� �� �� x
		// Dog Ŭ���� �ȿ� ���� ������ �ְ�, ��� ���� �Ǵ� �� �� ���� ����.
		
		// ��Ȳ 3 : Dog Ŭ������ Animal Ŭ������ ������ �־���.
		// Animal Ŭ������ ���� Ŭ�����̰�, cry() �޼ҵ带 �����ߴ�.
		// Dog Ŭ������ ���� Ŭ�����̰�, cry() �޼ҵ带 ������(Override)�ߴٰ� �˷���
		// ��ü�� ������ �� : �θ� Ŭ���� ������ ��ü�� ����  ��  ��ĳ����(UpCasting) : �������� �߻�
		Animal animal = new Dog();		// Dog �� Animal ��  A a = new B();
		animal.cry();
		
		animal = new Cat();
		animal.cry();
		//animal.night();		// ���� : �θ� Ŭ����(Animal)���� night()�޼ҵ尡 ����.
		Cat cat = new Cat();
		cat.night();
		
	}//main()
}//class
