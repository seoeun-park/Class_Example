
public class Gobook extends Character {
	public Gobook() {
		exp = 40;
		energy = 50;
		level = 0;
		System.out.println("\n���α� ĳ���Ͱ� �����Ǿ����ϴ�!");
		printInfo();
	}

	@Override
	public void eat() {
		energy += 15;
	}

	@Override
	public void sleep() {
		energy += 10;
	}

	@Override
	public boolean play() {
		energy -= 30;
		exp += 15;
		levelUp();
		return checkEnergy();
	}

	@Override
	public boolean train() {
		energy -= 20;
		exp += 30;
		levelUp();
		return checkEnergy();
	}

	@Override
	public void levelUp() {
		if (exp >= 50) {
			level++;
			exp -= 50;
			System.out.println("������ �Ǿ����ϴ�.");
		}
	}
	
}//class
