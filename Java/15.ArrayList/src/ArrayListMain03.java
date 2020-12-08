import java.util.ArrayList;

public class ArrayListMain03 {
	public static void main(String[] args) {
		//ArrayList<> list에 정수 10, 20, 30, 40, 50을 저장(add())하고 출력(get())
		//ArrayList<Object> list = new ArrayList<>();		//Object : 출력 시 Casting 필요
		ArrayList<Integer> list = new ArrayList<>();		//Integer 제한 : Casting 필요
		
		list.add(new Integer(10));		// 정상적인 구현 방식 : new 키워드로 객체 생성
		list.add(new Integer(20));
		list.add(30);		// int → Integer 변환  ▶  AutoBoxing : 컴파일러(JVM)가 자동으로 처리
		list.add(40);
		list.add(50);
		
		System.out.println((Integer)list.get(0));		// Casting
		System.out.println((Integer)list.get(1));		
		System.out.println(list.get(2));		// 원래 타입으로 변환(Integer → int) ▶  AutoUnBoxing
		System.out.println(list.get(3));
		System.out.println(list.get(4));
		
	}//main()
}//class
