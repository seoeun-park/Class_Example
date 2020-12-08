import java.util.ArrayList;

import com.hanul.array.Test;

public class ArrayListMain02 {
	public static void main(String[] args) {
		// ArrayList<> 무한 배열 객체 생성(list1) → Object : 모든 객체(클래스)를 다 받음
		ArrayList<Object> list1 = new ArrayList<>();	// 객체 생성 시(선언x) Element 타입은 생략 가능
		//list1.add(100);		// Element(요소)는 반드시 클래스(객체) 타입만 가능
		list1.add(new Integer(100));
		list1.add(new String("JAVA"));
		list1.add(new Test());
		
		// list1의 내용(값)을 출력 또는 생성된 객체(Test.java)안에 있는 메소드를 호출
		for (int i = 0; i < list1.size(); i++) {
			// 여러 자료형의 객체가 생성되었을 경우 Object Type를 사용
			Object obj = list1.get(i);				// list1의 i번째 index 값을 가져온다. : Object Type
			if(obj instanceof Integer) {			// obj의 타입이 Integer 타입과 일치하는 지
				System.out.println((Integer)obj);	// Integer 타입으로 Casting
			} else if(obj instanceof String) {		// obj의 타입이 String 타입과 일치하는 지
				System.out.println((String)obj);	// String 타입으로 Casting
			} else if(obj instanceof Test) {		// obj의 타입이 Test 타입과 일치하는 지
				((Test)obj).display();				// Test 타입으로 Casting 한 후 메소드 호출
			}//if
		}//for
		
		//============================================================================
		
		// ArrayList<> 객체 생성(list2) : → 특정 클래스(Test.java)만 저장하기 위해 타입을 제한
		ArrayList<Test> list2 = new ArrayList<>();		// 선언 시 Element 요소를 지정한다.
		list2.add(new Test());
		//list2.add(new Integer(100));		// 오류 : 선언 시 지정한 타입과 다르기 때문에
		
		list2.get(0).display();		// 타입이 지정되어 있기 때문에 Casting이 필요하지 x
		
	}//main()
}//class
