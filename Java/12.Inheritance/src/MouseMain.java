import com.hanul.mouse.Mouse;
import com.hanul.mouse.OpticalMouse;
import com.hanul.mouse.WheelMouse;

public class MouseMain {
	public static void main(String[] args) {
		System.out.println("Mouse Class");
		Mouse m = new Mouse();		//Mouse ��ü ����
		m.clickLeft();
		m.clickRight();
		
		System.out.println("\nWheelMouse Class");
		WheelMouse wm = new WheelMouse();
		wm.clickLeft();			// ��ӹ��� ���� Ŭ����(Mouse)�� �޼ҵ�
		wm.clickRight();		// ��ӹ��� ���� Ŭ����(Mouse)�� �޼ҵ�
		wm.scroll();			// ���� Ŭ����(WheelMouse)�� �޼ҵ�
		
		System.out.println("\nOpticalMouse Class");
		OpticalMouse om = new OpticalMouse();		//OpticalMouse ��ü ����
		om.clickLeft();			// ��ӹ��� ���� Ŭ����(Mouse)�� �޼ҵ�
		om.clickRight();		// ��ӹ��� ���� Ŭ����(Mouse)�� �޼ҵ�
		om.scroll();			// ���� Ŭ����(WheelMouse)�� �޼ҵ�
		

	}//main()
}//class
