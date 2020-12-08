import java.util.ArrayList;

public class ArrayListMain05 {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		list.add(new String("AAA"));
		list.add("BBB");
		list.add("CCC");
		System.out.println(list);
		
		list.add(1, "DDD");			//index 위치에 값이 저장되고, 기존 값이 있다면 기존 값은 뒤로 이동된다.
		System.out.println(list);
		
		list.set(1, "EEE");			//index 위치 값이 수정 : set()
		System.out.println(list);
		
		list.remove(1);				//index 위치 값이 삭제되고 기존 값들은 앞으로 이동
		System.out.println(list);
		
		list.removeAll(list);		//list 전체 값이 삭제
		System.out.println(list);
		
	}//main()
}//class
