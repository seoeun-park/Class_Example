package com.hanul.mouse;
public class WheelMouse extends Mouse {		// 하위 클래스(자식 클래스, Sub Class) 역할을 수행
// extends : 상위 클래스인 Mouse Class를 하위 클래스인 WheelMouse Class가 상속 받음	
	
	public void scroll() {
		System.out.println("스크롤 기능 추가");
	}//scroll()
	
}//class
