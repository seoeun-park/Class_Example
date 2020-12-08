import com.hanul.poly01.Animal;
import com.hanul.poly01.Cat;
import com.hanul.poly01.Dog;

public class Poly01Main01 {
	// Dog 객체를 생성하고 cry() 메소드를 호출
	public static void main(String[] args) {
		
		// 상황 1 : Dog 클래스를 자신이 직접 만들었다.
		// Dog 클래스 안에 무슨 동작이 있고, 그 동작이 어떻게 구동이 되는 지 알고 있다.
		Dog dog = new Dog();		// 객체 생성 : 일반적으로 객체를 생성하는 방법  ▶  A a = new A();
		dog.cry();
		
		// 상황 2 : Dog 클래스를 다른 사람이 만들어서 나에게 주었다(Dog.class) 
		//		  → .java가 아닌 .class일 경우 직접 열어서 볼 수 x
		// Dog 클래스 안에 무슨 동작이 있고, 어떻게 구동 되는 지 알 수가 없다.
		
		// 상황 3 : Dog 클래스와 Animal 클래스를 나에게 주었다.
		// Animal 클래스가 상위 클래스이고, cry() 메소드를 정의했다.
		// Dog 클래스가 하위 클래스이고, cry() 메소드를 재정의(Override)했다고 알려줌
		// 객체를 생성할 때 : 부모 클래스 쪽으로 객체를 생성  ▶  업캐스팅(UpCasting) : 다형성이 발생
		Animal animal = new Dog();		// Dog → Animal ▶  A a = new B();
		animal.cry();
		
		animal = new Cat();
		animal.cry();
		//animal.night();		// 오류 : 부모 클래스(Animal)에는 night()메소드가 없다.
		Cat cat = new Cat();
		cat.night();
		
	}//main()
}//class
