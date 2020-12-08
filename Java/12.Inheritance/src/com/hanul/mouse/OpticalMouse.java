package com.hanul.mouse;
public class OpticalMouse extends WheelMouse{
	// 상위 클래스인 WheelMouse Class를 하위 클래스인 OpticalMouse Class가 상속 받음

	// 오버라이드(Override) : 자식 클래스에서 부모 클래스로부터 상속받은 메소드를 재정의(수정)
	
	// 오버라이드 된 메소드인지, 새로 생성한 메소드인지 구별하기 위해 
	// 1. 오버라이드된 메소드 상단부에는 @Override라고 표기해주거나
	@Override
	public void clickLeft() {
		System.out.println("광마우스 왼쪽 클릭");
	}//clickLeft()
	
	// 2. Source 메뉴바 > Override / Implement Method 클릭 > 오버라이드할 메소드 선택
	@Override
	public void clickRight() {
		// super.clickRight();
		// → 구현부를 재정의 하지 않으면 부모 클래스의 해당 메소드를 그대로 실행시킨다는 의미
		System.out.println("광마우스 오른쪽 클릭");
	}
	
	// 3. Ctrl + Spacebar > 오버라이드할 메소드 선택
	@Override
	public void scroll() {
		// super.scroll();
		System.out.println("광마우스 스크롤 기능");
	}
}//class

/*
  	오버라이딩의 조건
  	
 	1. 반드시 슈퍼 클래스 메소드와 동일한 이름, 동일한 호출 인자, 반환 타입을 가져야 한다.
 	
	2. 오버라이딩된 메소드의 접근 지정자는 슈퍼 클래스의 메소드의 접근 지정자 보다 좁아질 수 없다.
    public > protected > private 순으로 지정 범위가 좁아진다.
    
	3. 반환 타입이 다르면 오류
	
	4. static, private, 또는 final 메소드는 오버라이딩 될 수 없다.
 */
