import com.hanul.finalanimal.Final_Dog;
import com.hanul.finalanimal.Final_Tiger;
import com.hanul.finalanimal.Final_Action;
import com.hanul.finalanimal.Final_Cat;

public class Final_Animal_Main {
	public static void main(String[] args) {
		Final_Dog dog = new Final_Dog();	//일반적인 객체생성
		Final_Cat cat = new Final_Cat();
		Final_Tiger tiger = new Final_Tiger();
		
		dog.setName("강아지");
		cat.setName("고양이");
		tiger.setName("호랑이");
		
		Final_Action action = new Final_Action();
		action.action(dog);
		System.out.println("===============");
		action.action(cat);
		System.out.println("===============");
		action.action(tiger);
		
	}//main()
}//class
