import com.hanul.mouse.Mouse;
import com.hanul.mouse.OpticalMouse;
import com.hanul.mouse.WheelMouse;

public class MouseMain {
	public static void main(String[] args) {
		System.out.println("Mouse Class");
		Mouse m = new Mouse();		//Mouse 객체 생성
		m.clickLeft();
		m.clickRight();
		
		System.out.println("\nWheelMouse Class");
		WheelMouse wm = new WheelMouse();
		wm.clickLeft();			// 상속받은 상위 클래스(Mouse)의 메소드
		wm.clickRight();		// 상속받은 상위 클래스(Mouse)의 메소드
		wm.scroll();			// 하위 클래스(WheelMouse)의 메소드
		
		System.out.println("\nOpticalMouse Class");
		OpticalMouse om = new OpticalMouse();		//OpticalMouse 객체 생성
		om.clickLeft();			// 상속받은 상위 클래스(Mouse)의 메소드
		om.clickRight();		// 상속받은 상위 클래스(Mouse)의 메소드
		om.scroll();			// 하위 클래스(WheelMouse)의 메소드
		

	}//main()
}//class
