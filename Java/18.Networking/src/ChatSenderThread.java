import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

//������ Thread : �޼����� �۽�(���)    ��  PrintWriter
public class ChatSenderThread extends Thread{		//Thread Class�� ���
	private Socket socket;
	
	public ChatSenderThread(Socket socket) {
		this.socket = socket;
	}		
	
	@Override
	public void run() {
		try {
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			Scanner scanner = new Scanner(System.in);
			
			while (true) {
				System.out.print("������ �޼����� �Է��ϼ��� : ");
				String msg = scanner.nextLine();
				
				if (msg.equals("bye")) {
					System.out.println("����Ǿ����ϴ�.");
					System.exit(0);		//�޸𸮿��� ������ �����ϱ� ���ؼ�
					break;
				}
				
				pw.println(msg);
				pw.flush();		//��������
			}//while
			
			scanner.close();
			pw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChatSenderThread Exception!");
		} finally {				//Client�� Server���� ���� ���� socket�� Thread���� �ݾƾ��Ѵ�.		
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
		}//try-catch-finally
			
	}//run()
	
}//class
