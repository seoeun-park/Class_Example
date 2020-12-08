import javax.swing.JLabel;

public class TimerThread extends Thread{
	// 창을 만드는 것 ▶
	// frame > AWT
	// jframe > SWING
	
	// 멤버변수
	private JLabel label;
	
	// 디폴트 생성자 → 매개변수로 frame을 넘겨주는 역할
	public TimerThread(JLabel label) {
		this.label = label;
	}
	
	@Override
	public void run() {
		int cnt = 0;
		while(true) {
			//int 자료형의 값을 String으로 출력
			label.setText(Integer.toString(cnt));
			cnt++;
			try {
				sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}//run()
	
}
