import java.util.Arrays;

public class Test_String {
	// 주어진 문자열(str)을 @을 기준으로 문자열을 분리하고 리턴하는 메소드(strSplit()) 호출 
	// 출력하는 메소드(display()) 메소드 호출
	// 과일명의 내림차순으로 정렬하는 메소드(fruitNameDescSort())
	// 출력하는 메소드(display()) 메소드 호출
	
	public static void main(String[] args) {
		String str = "멜론@오렌지@청포도@자몽@두리안";
		
		String[] result = strSplit(str);
		
		System.out.print("정렬 전 : ");
		display(result);
		fruitNameDescSort(result);
		System.out.print("정렬 후 : ");
		display(result);
	}//main
	
	// 문자열을 분리하고 리턴하는 메소드 정의
	public static String[] strSplit(String str) {
		String[] str1 = str.split("@");
		return str1;
		//return str.split("@");
	}//strSplit()
	
	// 출력 메소드 정의
	public static void display(String[] strs) {
		System.out.println(Arrays.toString(strs));
	}//display()
	
	// 과일명의 내림차순으로 정렬하는 메소드 정의
	public static void fruitNameDescSort(String[] strs) {
		for (int i = 0; i < strs.length; i++) {
			for (int j = i + 1; j < strs.length; j++) {
				if (strs[i].compareTo(strs[j]) < 0) {
					String temp = strs[i];
					strs[i] = strs[j];
					strs[j] = temp;
				}
			}//for j
		}//for i
	}//fruitNameDescSort()
}//class
