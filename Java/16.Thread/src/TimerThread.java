import javax.swing.JLabel;

public class TimerThread extends Thread{
	// â�� ����� �� ��
	// frame > AWT
	// jframe > SWING
	
	// �������
	private JLabel label;
	
	// ����Ʈ ������ �� �Ű������� frame�� �Ѱ��ִ� ����
	public TimerThread(JLabel label) {
		this.label = label;
	}
	
	@Override
	public void run() {
		int cnt = 0;
		while(true) {
			//int �ڷ����� ���� String���� ���
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
