import com.hanul.poly01.Animal;
import com.hanul.poly01.Cat;
import com.hanul.poly01.Dog;

public class Poly01Main02 {
	public static void main(String[] args) {
		Dog dog = new Dog();	//일반적인 객체 생성 방법
		dog.cry();
		
		Animal animal = new Cat();	//업캐스팅 : 다형성이 발생
		animal.cry();				//상위 클래스가 동작을 시킨다.
		//animal.night();			//오류발생 : night()는 하위 클래스(Cat)에서만 정의된 메소드
		
		Cat cat = (Cat)animal;		//다운캐스팅
		cat.night();
		((Cat)animal).night();
		
	}//main()
}//class

/*
○ 객체를 생성하는 방법
 - Dog dog = new Dog();		  	  ▶  일반적인 방식 : A a = new A();
 - Animal animal = new Dog();	  ▶ 업캐스팅(UpCasting) : A a = new A(); → 다형성
 
○ 다형성의 전제 조건
 - 상속 관계 : public class 하위 클래스(B) extends 상위클래스(A) { ... }  ▶    B → A
 - Override 필수 : 하위 클래스(B)는 상위 클래스(A)에서 정의한 기능(메소드)을 반드시 재정의해야 한다.
 - UpCasting으로 객체를 생성 : 상위 클래스 쪽으로 할당  ▶  A a = new B();
 - 상위클래스로부터 상위 클래스에서 정의되지 않은, 하위 클래스에서만 정의된 메소드는 다형성을 발생시킬 수 없다. 
 - 그러나, 상위 클래스를 하위 클래스로 다운캐스팅 시킨다면 다형성을 발생시킬 수 있다.
*/
