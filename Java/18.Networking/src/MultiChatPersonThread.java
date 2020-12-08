import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;

//���ӵ� �ټ��� Ŭ���̾�Ʈ���� ���۵Ǵ� ������
//���ӵ� ��� Ŭ���̾�Ʈ�� ���� ������ �����ϰ�
//���ӵ� Ŭ���̾�Ʈ���� �޼����� ����(�۽�, ����)�� �� �ֵ���
//Ŭ���̾�Ʈ�� ����� ������ ���� �迭�� ������ �� ArrayList<>
//MultiChatServer Class�� main() �޼ҵ�� ���� ���� : static
public class MultiChatPersonThread extends Thread{
	private Socket socket;
	private PrintWriter pw;
	static ArrayList<PrintWriter> list = new ArrayList<>();
	
	public MultiChatPersonThread(Socket socket) {
		this.socket = socket;
		try {
			OutputStream os = socket.getOutputStream();
			pw = new PrintWriter(os);
			list.add(pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		String name = null;
		InetAddress addr = socket.getInetAddress();
		String comName = addr.getHostName();
		
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			//Ŭ���̾�Ʈ���� �� ó���� �Էµ� �޼���(��ȭ��)�� �޾�
			//���ӵ� �ٸ� Ŭ���̾�Ʈ ȭ�鿡 ���  ��  sendAll()
			name = br.readLine();
			sendAll("#" + name + "(" + comName + ")�Բ��� �����ϼ̽��ϴ�!");
			// #ȫ�浿(201-xx)�Բ��� �����ϼ̽��ϴ�!
			
			//Ŭ���̾�Ʈ���� ���� �޼���(��ȭ ����)�� ���ӵ� �ٸ� Ŭ���̾�Ʈ���� ����
			while (true) {
				String msg = br.readLine();
				if (msg == null) {
					break;
				}//if
				sendAll(name + "(" + comName + ") : " + msg);
				// #ȫ�浿(201-xx) : �ȳ��ϼ���
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatPersonThread Exception");
		} finally {
			try {
				list.remove(pw);	//���� ��Ͽ��� ����
				sendAll("#" + name + "(" + comName + ")�Բ��� �����ϼ̽��ϴ�!");
				// #ȫ�浿(201-xx)�Բ��� �����ϼ̽��ϴ�!
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//try-catch-finally
	}//run()
	
	public void sendAll(String msg) {
		for (PrintWriter pw : list) {
			pw.println(pw);
			pw.flush();
		}//for-each
	}//sendAll()
}//class
