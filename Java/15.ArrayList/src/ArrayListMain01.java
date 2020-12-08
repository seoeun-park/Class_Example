import java.util.ArrayList;
import java.util.Arrays;

import com.hanul.array.Test;

public class ArrayListMain01 {
	public static void main(String[] args) {
		// 3개의 길이(크기)를 갖는 정수형 배열(arr[])을 선언 및 생성하시오.
		int[] arr = new int[3];
		
		// 배열(arr[])에 10, 20, 30을 할당하시오.
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
		
		for (int i = 0; i < arr.length; i++) {
			arr[i] = (i + 1) * 10; 
		}
		
		// 배열(arr[])의 내용을 출력하시오
		for (int i = 0; i < arr.length; i++) {
			System.out.println("arr[" + i + "]의 값 : " + arr[i]);
		}
		
		System.out.println("arr[]의 값 : " + Arrays.toString(arr));
		//========================================================
		
		// Test.java(클래스) 타입 5개를 저장할 수 있는 배열을 생성 : com.hanul.array package
		Test[] test = new Test[5];		//배열구조 : 크기(길이)가 고정
		
		// Test.java(클래스) 타입을 크기(길이)에 제한이 없는 무한 배열로 구현 : ArrayList<>
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(new Test());		// add() : 삽입(추가)
		list.add(new Test());
		list.add(new Test());
		list.add(new Test());
		list.add(new Test());
		list.add(new Test());
		
		// ArrayList<>에 저장된 Test 클래스의 display() 메소드를 호출
		for (int i = 0; i < list.size(); i++) {		//size() : ArrayList<>의 크기(길이)
			//list.display()		
			// 오류 : display 메소드는 Test 클래스안에 있는 메소드이므로 list를 Test로 Casting시켜야 한다.
			((Test)(list.get(i))).display();	//get() : 출력(값을 가지고 옴)
		}
		
		//System.out.println(Arrays.toString(list));
		// ArrayList는 Arrays 클래스의 toString 메소드로 출력할 수 없다.
		
	}//main()
}//class

/*
○ Array[] : 배열
- 순차적(index)으로 어떤 자료를 저장한다.
- 배열의 크기(길이)를 먼저 선언해야 한다.
- 자료의 타입이 동일해야 한다.
- 배열 생성 시 객체화(객체 생성)되어야 한다. ▶  new int[3];
- 중요한 메소드 : length → 크기(길이)를 구함

○ ArrayList<> : 무한 배열
- 순차적(index)으로 어떤 자료를 저장한다.
- 배열의 크기(길이)를 선언하지 않는다.
- 자료의 타입이 달라도 된다.(한번에 다양한 타입의 자료를 저장하는 것을 허용)
- 단, 클래스 타입만 저장이 가능하다.(즉, <>괄호 안에 클래스 타입만 들어와야 한다.)
- 배열 생성 시 객체화(객체생성)되어야 한다. ▶  new ArrayList<>();
- 중요한 메소드 : size() → 크기, add() → 삽입, get() → 출력, set() → 수정, remove() → 삭제
 */
