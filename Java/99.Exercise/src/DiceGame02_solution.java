
import java.util.Random;
import java.util.Scanner;

public class DiceGame02_solution {

	public static void main(String[] args) {

		Random random = new Random();
		Scanner scanner = new Scanner(System.in);

		START:	// ������ ��� �ϱ����� �ݺ��� START��� LABEL ����

			while (true) { 
				System.out.println("���ӽ��� : 1");
				System.out.println("����ڰ� ������ ���� : 2");
				System.out.println("����ڰ� Ȯ���� �̱�� ���� : 3");
				System.out.println("�������� : 4\n");
				System.out.print("���Ͻô� ���� ���ڸ� �Է��ϼ��� :  ");

				int userInput = Integer.parseInt(scanner.nextLine()); // ������ ���ϴ� ����
				int comNum = random.nextInt(6) + 1; 	// ��ǻ�� ���� ���� 1~6
				int userNum = random.nextInt(6) + 1; 	// ����� ���� ���� 1~6

				if (userInput == 4) { // ��������
					System.out.println("������ �����մϴ�.");
					break;

				} else if (userInput == 1) { // �������� ����

					System.out.println("\n�ֻ��� ������ �����մϴ�.\n");
					System.out.println("����ڰ� �ֻ����� �����ϴ�.");
					System.out.print("�ֻ����� �������� EnterŰ�� ��������");
					scanner.nextLine();

					System.out.println("�ڻ���� �ֻ��� �� : " + userNum);
					System.out.println("\n��ǻ�Ͱ� �ֻ����� �����ϴ�.");
					System.out.print("�ֻ����� �������� EnterŰ�� ��������");
					scanner.nextLine();

					System.out.println("����ǻ�� �ֻ��� �� : " + comNum);

					if (userNum > comNum) { // �� ���Ͽ� �ºΰ�� ���
						System.out.println("\n����ڰ� �̰���ϴ�\n");
					} else if (userNum == comNum) {
						System.out.println("\n�����ϴ�\n");
					} else {
						System.out.println("\n��ǻ�Ͱ� �̰���ϴ�\n");
					}//if

					System.out.println("------------------------------------------");

					continue; // ������ ������ �ݺ��� ó������ ���ư�

				} else if (userInput == 2) { // ����ڰ� ������ ������ ����
					System.out.println("\n�ֻ��� ������ �����մϴ�.\n");
					System.out.println("����ڰ� �ֻ����� �����ϴ�.");
					System.out.print("�ֻ����� �������� EnterŰ�� ��������");
					scanner.nextLine();

					while (true) {
						if (comNum <= userNum) { // ����� ���ڰ� ��ǻ�� ���ں��� ���ų� ������ �� �ݺ��� Ż��
							break;
						} else { // ����� ���ڰ� ��ǻ�� ���ڿ� ���ų� ���������� ����� ���� ���Ҵ�
							
							// �� ����� ����, ��ǻ�� ���� �Ѵ� ���Ҵ��ص��ǰ� ���� �ϳ��� ���Ҵ��ص���
							userNum = random.nextInt(6) + 1;
							// comNum = random.nextInt(6) + 1;

							continue; // ������ ������ �ݺ��� ó������ ���ư�
						}//if
					}//while

					System.out.println("�ڻ���� �ֻ��� �� : " + userNum);
					System.out.println("\n��ǻ�Ͱ� �ֻ����� �����ϴ�.");
					System.out.print("�ֻ����� �������� EnterŰ�� ��������");
					scanner.nextLine();

					System.out.println("����ǻ�� �ֻ��� �� : " + comNum);

					if (userNum > comNum) { // �� ���Ͽ� �ºΰ�� ���
						System.out.println("\n����ڰ� �̰���ϴ�\n");
					} 
					/*
					 * ��ǻ� ���� �����ϱ� �ؿ� "��ǻ�Ͱ� �̰���ϴ�"���� ������� �̷��� ���������� else{
					 * System.out.println("\n�����ϴ�\n"); }
					 */

					else if (userNum == comNum) {
						System.out.println("\n�����ϴ�\n");
					} else {
						System.out.println("\n��ǻ�Ͱ� �̰���ϴ�\n");
					}//if

					System.out.println("------------------------------------------");
					continue;

				} else if (userInput == 3) { // ����ڰ� �ۼ�Ʈ�� �̱�� ����
					int winPct; // Ȯ���� ���� ����

					while (true) { // 0���� 100������ Ȯ���� ���ϴ� Ȯ���� �Է�
						System.out.print("Ȯ���� �Է����ּ��� : ");
						winPct = Integer.parseInt(scanner.nextLine());
						
						if (winPct < 0 || winPct > 100) { // ���ü� ���� Ȯ�� ����
							System.out.println("Ȯ���� �߸� �Է��ϼ̽��ϴ�");
							continue;
						}
						break;
					}//while

					while (true) {
						int pct = random.nextInt(100) + 1; // 1~100 ���� �� �����ϰ� �ϳ��� �� ����

						System.out.println("\n�ֻ��� ������ �����մϴ�.\n");
						System.out.println("����ڰ� �ֻ����� �����ϴ�.");
						System.out.print("�ֻ����� �������� EnterŰ�� ��������");
						scanner.nextLine();

						if (pct <= winPct) { // �Է��� Ȯ�� ���ں��� �������� ������ ���ڰ� �۰ų� ������ ���� �¸�
							while (true) { // ����ڼ��ڰ� ��ǻ�� ���ں��� ���ų� ������ ������
								
								// ����� ���ڰ� ��ǻ�� ���ں��� ���������� ����� ���� ���Ҵ�
								if (comNum < userNum) {
									break;
								} else {
								/*
								* �� �� ������ ���Ӱ� �ٸ��� ���⼱ �Ѵ� ���Ҵ� �ؾ��� 
								* 	- ��ǻ�� ���ڸ� ���Ҵ� �� ��� : ����� ���ڰ� 1�� ��� ��ǻ�� ���ڰ� �� ����
								* ���� ���ü� ��� ���ѷ��� 
								* 	- ����� ���ڸ� ���Ҵ� �� ��� : ��ǻ�� ���ڰ� 6�� ��� ����� ���ڰ� �� ū ���� ���ü� ��� ���ѷ���
								*/
									userNum = random.nextInt(6) + 1;
									comNum = random.nextInt(6) + 1;
									continue;
								}
							}
						} else { // �Է��� Ȯ�� ���ں��� �������� ������ ���ڰ� ������ ������ ���º� �Ǵ� �й�
							while (true) {
								if (comNum >= userNum) { // ��ǻ�� ���ڰ� ����� ���ں��� ���ų� ������
									// �� �ݺ��� Ż��
									break;
								} else {
									// �� ����� ����, ��ǻ�� ���� �Ѵ� ���Ҵ��ص��ǰ� ���� �ϳ��� ���Ҵ��ص���
									comNum = random.nextInt(6) + 1;
									// userNum = random.nextInt(6) + 1;

									continue;
								}//if
							}//while
						}//if

						System.out.println("�ڻ���� �ֻ��� �� : " + userNum);
						System.out.println("\n��ǻ�Ͱ� �ֻ����� �����ϴ�.");
						System.out.print("�ֻ����� �������� EnterŰ�� ��������");
						scanner.nextLine();

						System.out.println("����ǻ�� �ֻ��� �� : " + comNum);

						if (userNum > comNum) {
							System.out.println("\n����ڰ� �̰���ϴ�\n");
						} else if (userNum == comNum) {
							System.out.println("\n�����ϴ�\n");
						} else {
							System.out.println("\n��ǻ�Ͱ� �̰���ϴ�\n");
						}//if

						System.out.println("------------------------------------------");

						System.out.println("����ڰ� Ȯ���� �̱�� ����");

						System.out.println("��� : 1 Ȯ�� ���� : 2  ���� : 3");

						while (true) { // Ȯ���� �̱�� ���� 1�� 2 �� �ܴ̿� �ٽ� ���� �Է� ����
							userInput = Integer.parseInt(scanner.nextLine());

							if (userInput == 3) {
								continue START; // ������ ���ϴ� ȭ�� (LABEL�� START�� ������)
								// �ݺ������� �ٽ� ���ư�
							} else if (userInput == 1) { // �ֻ��� �� �� �Ҵ��ϰ� ���� �ݺ����� Ż���Ͽ� ������ �ٽ� �ݺ�
								userNum = random.nextInt(6) + 1; // ������ �ٽ��ϱ����� �ֻ��� �� �� �Ҵ�
								comNum = random.nextInt(6) + 1;

								break;
							} else if (userInput == 2) { // Ȯ�� ���� ���� �Է��ϰ� ���� �ݺ����� Ż���Ͽ� ������ �ٽ� �ݺ�
								System.out.print("Ȯ���� �Է����ּ��� : ");
								winPct = Integer.parseInt(scanner.nextLine()); // Ȯ�� �� ���� �Է� ����
								userNum = random.nextInt(6) + 1; // ������ �ٽ��ϱ����� �ֻ��� �� ���Ҵ���
								comNum = random.nextInt(6) + 1;

								break;

							} else { // ���� ���� �� �̿ܿ� �Է¹޾Ƽ� �ٽ� �Է��� �䱸��
								System.out.println("���ڸ� �߸� �Է��ϼ̽��ϴ�!");
								continue;
							}//if
						}//while
						continue; // ������ ������ Ȯ���� �̱�� ���� �ݺ��� ó������ ���ư�
					}//while

				} else { // ó�� ���� ���ϴ� ���� 1~4 �� ���� �ٸ� ���ڸ� �Է½� �ٽ� ó������ ���ư�

					System.out.println("���ڸ� �߸� �Է��ϼ̽��ϴ�!");
					continue;
				}//if
			}//while

		scanner.close();

	}//main()

}//class