public class Ex_switch_case {
	public static void main(String[] args) {
		/*
		 �� ���ù�(switch ~~ case ~~) : ���� if���� �����ϰ� ǥ��
		 
		 switch (���ذ�) {
		 	case ��1 :
		 		��1�� ���� �� ����Ǵ� ����;
		 		break;
		 	case ��2 :
		 		��2�� ���� �� ����Ǵ� ����;
		 		break;
		 	case ��N :
		 		��N�� ���� �� ����Ǵ� ����;
		 		break;
		 	default :
		 		������ �� ����Ǵ� ����;
		 		break;
		 }
		 
		 �� ���ذ�, �񱳰�(��1, ��2, ��N)�� ������(��ġ��)�� �ڷ����̾�� �Ѵ�.
		�� ���๮ �ڿ��� �ݵ�� break; �� �Է��ؾ� �Ѵ�.
		�� �̷��� ���ѻ���(��������)���� ���Ͽ� �ǹ������� ���� ������ �ʴ´�. 
		 
		*/
		
		int score = 87;
		
		switch (score / 10) {
		case 10:		// 100��
		// case >=90					// ������ ����
			// System.out.println("A����");
			// break;
		case 9:			// 90 ~ 99��
			System.out.println("A����");
			break;
		case 8:			// 80 ~ 89��
			System.out.println("B����");
			break;
		case 7:			// 70 ~ 79��
			System.out.println("C����");
			break;
		case 6:			// 60 ~ 69��
			System.out.println("D����");
			break;
		default:		// 60�� �̸�
			System.out.println("F����");
			break;
		}
		
	} //main()
} //class
