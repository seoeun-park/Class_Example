import com.hanul.poly01.Animal;
import com.hanul.poly01.Cat;
import com.hanul.poly01.Dog;

public class Poly01Main02 {
	public static void main(String[] args) {
		Dog dog = new Dog();	//�Ϲ����� ��ü ���� ���
		dog.cry();
		
		Animal animal = new Cat();	//��ĳ���� : �������� �߻�
		animal.cry();				//���� Ŭ������ ������ ��Ų��.
		//animal.night();			//�����߻� : night()�� ���� Ŭ����(Cat)������ ���ǵ� �޼ҵ�
		
		Cat cat = (Cat)animal;		//�ٿ�ĳ����
		cat.night();
		((Cat)animal).night();
		
	}//main()
}//class

/*
�� ��ü�� �����ϴ� ���
 - Dog dog = new Dog();		  	  ��  �Ϲ����� ��� : A a = new A();
 - Animal animal = new Dog();	  �� ��ĳ����(UpCasting) : A a = new A(); �� ������
 
�� �������� ���� ����
 - ��� ���� : public class ���� Ŭ����(B) extends ����Ŭ����(A) { ... }  ��    B �� A
 - Override �ʼ� : ���� Ŭ����(B)�� ���� Ŭ����(A)���� ������ ���(�޼ҵ�)�� �ݵ�� �������ؾ� �Ѵ�.
 - UpCasting���� ��ü�� ���� : ���� Ŭ���� ������ �Ҵ�  ��  A a = new B();
 - ����Ŭ�����κ��� ���� Ŭ�������� ���ǵ��� ����, ���� Ŭ���������� ���ǵ� �޼ҵ�� �������� �߻���ų �� ����. 
 - �׷���, ���� Ŭ������ ���� Ŭ������ �ٿ�ĳ���� ��Ų�ٸ� �������� �߻���ų �� �ִ�.
*/
