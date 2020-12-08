public abstract class Character {	//추상 클래스 : 1개 이상의 추상 메소드 有(오버라이딩 필수)
	// 멤버변수 선언
	public int exp;
	public int energy;
	public int level;
	
	// 추상 메소드(캐릭터마다 값이 다 다르기 때문에 오버라이딩을 필수로 해야 하는 추상 메소드로 정의)
	public abstract void eat();
	public abstract void sleep();
	public abstract boolean play();
	public abstract boolean train();
	public abstract void levelUp();
	
	// 일반 메소드
	// 에너지 체크
	public boolean checkEnergy() {
		if(energy > 0) {
			return true;
		} else {
			return false;
		}
	}//checkEnergy()
	
	// 현재 상태를 출력
	public void printInfo() {
		System.out.println("===============================");
		System.out.println("현재 캐릭터의 정보를 출력합니다!");
		System.out.println("경험치 : " + exp);
		System.out.println("에너지 : " + energy);
		System.out.println("레벨 : " + level);
		System.out.println("===============================");
		
	}//printInfo()
	
}//class
