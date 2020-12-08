import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JLabel;
//하나의 윈도우 창을 뜨게 하기 위해 JFrame 클래스를 상속
public class TimerThreadMain extends JFrame{
	public static void main(String[] args) {
		new TimerThreadMain();
		
	}//main()
	
	// 디폴트 생성자 : main 메소드의 생성자가 호출될때 실행되는 코드를 구현
	public TimerThreadMain() {
		setSize(300, 200);					//프레임(윈도우 창)의 크기
		setVisible(true);					//화면 표시
		setTitle("Timer Thread Exam");		//제목 표시줄
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		// 윈도우 창의 닫기 버튼을 누르더라도 화면상에서 보이지 않는 것이지 완전히 종료된것이 아니다.
		// 그러므로 setDefaultCloseOperation()를 이용해서 닫기버튼을 클릭하면 완전히 종료시켜야한다.
		setLocationRelativeTo(null);		//화면 중앙에 프레임 창 표시
		
		JLabel label = new JLabel();		//객체 생성 : 숫자가 출력될 레이블 생성
		label.setFont(new Font("Tahoma", Font.BOLD, 50));	//글꼴 설정
		
		TimerThread thread = new TimerThread(label);
		
		Container container = getContentPane();		//컨테이너 : 컨버런트(요소)를 가두고있는 틀
		container.setLayout(new FlowLayout());		//컨테이너 배치
		container.add(label);		//label을 컨테이너에 등록
		thread.start();
	}
}//class
