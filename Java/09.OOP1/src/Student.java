import java.text.DecimalFormat;

public class Student {
	// ��� ����
	String name;
	int kor, eng, mat, sum;
	float avg;
	
	// ��� �޼ҵ�
	// ������ ����ϴ� ��� �޼ҵ�(getSum()) ����
	public int getSum(int kor, int eng, int mat) {
		sum = kor + eng + mat;
		return sum;
	}
	
	// ����� ����ϴ� ��� �޼ҵ�(getAvg()) ����
	public String getAvg(int kor, int eng, int mat) {
		avg = (float)sum / 3;
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(avg);
	}
	
	// ����ϴ� �޼ҵ�(display()) ����
	public void display() {
		System.out.println("�̸� : " + name);
		System.out.println("���� ���� : " + kor);
		System.out.println("���� ���� : " + eng);
		System.out.println("���� ���� : " + mat);
		
		// display �޼ҵ� �ȿ��� ��� �޼ҵ带 ȣ���Ͽ� ������ ����� ���
		System.out.println("���� : " + getSum(kor, eng, mat));
		System.out.println("���� : " + getAvg(kor, eng, mat));	
	}
}//class
