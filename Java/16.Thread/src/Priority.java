// 스레드는 우선순위(Priority)를 설정할 수 있다.
// 1(최소, MIN_PRIORITY)부터 10(최대, MAX_PRIORITY)까지 설정 가능
// 숫자가 높을수록 우선순위가 높다.
// 기본값(NORM_PRIORITY)은 5로 설정
// getPriority() 메소드로 우선순위를 확인 : 출력문 작성할 때
// setPriority() 메소드로 우선순위를 설정 : 실행문 작성할 때
// ※ 여기서 말하는 우선순위는 우선순위가 높다해서 해당 스레드가 먼저 실행되거나, 먼저 종료된다는 의미가 아니다.
//	 우선순위가 높다라는 개념은 스레드가 동작 시 점유권한을 높게 설정한다는 의미로 해석해야 한다.
public class Priority extends Thread{
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			System.out.println(getName() + "우선순위 : " + getPriority() + ", Hello" + i);
		}//for
	}//run()
}//class
