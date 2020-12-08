
public class Pikachu extends Character{		//��� : Pikachu �� Character
	// ����Ʈ ������ �޼ҵ� �� ��ü�� ������ �� �����ϴ� �޼ҵ� : ����ġ, ������, ���� �ʱ�ȭ
	public Pikachu() {
		exp = 30;
		energy = 50;
		level = 0;
		System.out.println("\n��ī�� ĳ���Ͱ� �����Ǿ����ϴ�.");
		printInfo();
	}

	// �޼ҵ� �������̵�
	@Override
	public void eat() {
		energy += 10;
	}

	@Override
	public void sleep() {
		energy += 5;
	}

	@Override
	public boolean play() {
		energy -= 20;
		exp += 5;
		levelUp();
		return checkEnergy();
	}

	@Override
	public boolean train() {
		energy -= 10;
		exp += 15;
		levelUp();
		return checkEnergy();
	}

	@Override
	public void levelUp() {
		if(exp >= 40) {
			level++;
			exp -= 40;
			System.out.println("������ �Ǿ����ϴ�.");
		}
	}
	
	
	
	
}
