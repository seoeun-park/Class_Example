public class Sleep extends Thread{
	// ����Ʈ �������� �Ű������� Ŭ���� ��ü���� Ȱ���ϱ� ���ؼ� ������� ����
	private int num;
	// ����Ʈ ������
	public Sleep(int num) {
		this.num = num;
	}
	
	@Override
	public void run() {
		for (int i = 1; i <= 10 ; i++) {
			System.out.print(num + ", ");
			try {
				sleep(1000);		//1000ms : 1��
				// ��� �����带 1�ʵ��� �Ͻ� ������Ŵ
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
		}//for
	}//run()
	
}//class
