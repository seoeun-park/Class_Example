import java.text.DecimalFormat;
import java.util.Scanner;

public class BodyMassIndex {
	public static void main(String[] args) {
		// ����(height)�� ü��(weight)�� �Է�(��: 175.5, 65.5)
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ �Է��ϼ���(�Է� �� : 175.5)   ��  ");
		float height = Float.parseFloat(scanner.nextLine());
		System.out.print("ü���� �Է��ϼ���(�Է� �� : 65.5)  �� ");
		float weight = Float.parseFloat(scanner.nextLine());
		scanner.close();
		
		// ����� ���
		System.out.println("�Է��Ͻ� ������ " + height + "cm �Դϴ�.");
		System.out.println("�Է��Ͻ� ü���� " + weight + "kg �Դϴ�.");
		BodyMassIndex bmi = new BodyMassIndex();	// ��ü ����
		System.out.println("������(ī��������)�� " + bmi.bmiCalc(height, weight) + "�Դϴ�.");
		System.out.println("�񸸵� ����� " + bmi.getResult(bmi.bmiCalc(height, weight)) + "�Դϴ�.");
		
	}//main()
	
	// ������(ī��������)�� ����ϴ� �޼ҵ�(bmiCalc()) : �Ҽ� ��°�ڸ����� ǥ��
	public String bmiCalc(float height, float weight) {
		float hh = (height / 100) * (height / 100);		// ������ ����
		float result = weight / hh;						// bmi ���� ���
		DecimalFormat df = new DecimalFormat("0.00");
		
		return df.format(result);
	}//bmiCalc()
	
	// �������� �������� �񸸵� ����� ���ϴ� �޼ҵ�(getResult())
	public String getResult(String bmi) {
		float index = Float.parseFloat(bmi);	//Wrapper Class : String �� float
		String result = null;					// ���� ����� ����� ���ڿ� ������ �ʱ�ȭ
		
		if (index >= 40) {
			result = "����";
		} else if (index >= 35) {
			result = "�ߵ ��";
		} else if (index >= 30) {
			result = "�浵�� ��";
		} else if (index >= 25) {
			result = "��ü��";
		} else if (index >= 20) {
			result = "����";
		} else {
			result = "��ü��";
		}
		
		return result;
		
	}//getResult()
	
}//class
