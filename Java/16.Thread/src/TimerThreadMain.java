import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JLabel;
//�ϳ��� ������ â�� �߰� �ϱ� ���� JFrame Ŭ������ ���
public class TimerThreadMain extends JFrame{
	public static void main(String[] args) {
		new TimerThreadMain();
		
	}//main()
	
	// ����Ʈ ������ : main �޼ҵ��� �����ڰ� ȣ��ɶ� ����Ǵ� �ڵ带 ����
	public TimerThreadMain() {
		setSize(300, 200);					//������(������ â)�� ũ��
		setVisible(true);					//ȭ�� ǥ��
		setTitle("Timer Thread Exam");		//���� ǥ����
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		// ������ â�� �ݱ� ��ư�� �������� ȭ��󿡼� ������ �ʴ� ������ ������ ����Ȱ��� �ƴϴ�.
		// �׷��Ƿ� setDefaultCloseOperation()�� �̿��ؼ� �ݱ��ư�� Ŭ���ϸ� ������ ������Ѿ��Ѵ�.
		setLocationRelativeTo(null);		//ȭ�� �߾ӿ� ������ â ǥ��
		
		JLabel label = new JLabel();		//��ü ���� : ���ڰ� ��µ� ���̺� ����
		label.setFont(new Font("Tahoma", Font.BOLD, 50));	//�۲� ����
		
		TimerThread thread = new TimerThread(label);
		
		Container container = getContentPane();		//�����̳� : ������Ʈ(���)�� ���ΰ��ִ� Ʋ
		container.setLayout(new FlowLayout());		//�����̳� ��ġ
		container.add(label);		//label�� �����̳ʿ� ���
		thread.start();
	}
}//class
