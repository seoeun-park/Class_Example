public abstract class Character {	//�߻� Ŭ���� : 1�� �̻��� �߻� �޼ҵ� ��(�������̵� �ʼ�)
	// ������� ����
	public int exp;
	public int energy;
	public int level;
	
	// �߻� �޼ҵ�(ĳ���͸��� ���� �� �ٸ��� ������ �������̵��� �ʼ��� �ؾ� �ϴ� �߻� �޼ҵ�� ����)
	public abstract void eat();
	public abstract void sleep();
	public abstract boolean play();
	public abstract boolean train();
	public abstract void levelUp();
	
	// �Ϲ� �޼ҵ�
	// ������ üũ
	public boolean checkEnergy() {
		if(energy > 0) {
			return true;
		} else {
			return false;
		}
	}//checkEnergy()
	
	// ���� ���¸� ���
	public void printInfo() {
		System.out.println("===============================");
		System.out.println("���� ĳ������ ������ ����մϴ�!");
		System.out.println("����ġ : " + exp);
		System.out.println("������ : " + energy);
		System.out.println("���� : " + level);
		System.out.println("===============================");
		
	}//printInfo()
	
}//class
