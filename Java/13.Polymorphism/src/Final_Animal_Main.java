import com.hanul.finalanimal.Final_Dog;
import com.hanul.finalanimal.Final_Tiger;
import com.hanul.finalanimal.Final_Action;
import com.hanul.finalanimal.Final_Cat;

public class Final_Animal_Main {
	public static void main(String[] args) {
		Final_Dog dog = new Final_Dog();	//�Ϲ����� ��ü����
		Final_Cat cat = new Final_Cat();
		Final_Tiger tiger = new Final_Tiger();
		
		dog.setName("������");
		cat.setName("�����");
		tiger.setName("ȣ����");
		
		Final_Action action = new Final_Action();
		action.action(dog);
		System.out.println("===============");
		action.action(cat);
		System.out.println("===============");
		action.action(tiger);
		
	}//main()
}//class
