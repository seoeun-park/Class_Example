import java.util.Arrays;

public class Ex_String01 {
	// String Class : 문자열을 조작하기 위한 기능을 담고 있는 클래스
	// SumMicroSystem(Oracle) 업체에서 미리서 제작하여 제공  ▶  API(Library)
	// API 문서(설명서) : www.oracle.com  ▶  Java Downloads ▶  Documentation ▶  JAVA SE API
	// ▶  https://docs.oracle.com/javase/8/docs/api/index.html
	// JRE System Library ▶  rt.jar ▶  java.lang.package ▶  String class 
	public static void main(String[] args) {
		String str1 = "apple";				// apple 문자열을 str1 변수에 할당
		String str2 = new String("APPLE");	// APPLE 문자열을 str2 객체에 할당
		
		
		System.out.println("str1 : " + str1);
		System.out.println("str2 : " + str2);
		
		// 문자열의 길이를 구하는 메소드 : length()
		System.out.println("str1의 길이 : " + str1.length());
		
		// 대문자로 변경하는 메소드 : toUpperCase()
		System.out.println("str1을 대문자로 변경 : " + str1.toUpperCase());
		
		// 소문자로 변경하는 메소드 : toLowerCase()
		System.out.println("str2을 소문자로 변경 : " + str2.toLowerCase());
		
		// 특정 문자만 추출하는 메소드 : subString()
		System.out.println(str1.substring(1));		// index 1부터 끝까지 추출
		System.out.println(str1.substring(1, 3));	// index 1부터 3의 앞까지만 추출
		
		// 주어진 문자열에서 특정 문자 한 글자만 추출하는 메소드 : charAt()
		System.out.println(str2.charAt(3));
		System.out.println(str2.substring(3, 4));
		
		// 찾고자 하는 문자가 존재하는 지 여부를 판단할 때 사용하는 메소드 : indexOf()
		// ▶ 존재할 경우 : index 값을 반환 / 존재하지 않는 경우 : -1 반환
		int index1 = str2.indexOf("P");
		int index2 = str2.indexOf("B");
		System.out.println(index1 + ", " + index2);
		
		// 문자열을 분리시킬 때 사용하는 메소드 : split() 
		// ▶  정해진 기호를 기준으로 문자열을 분리 : 결과는 String[] 반환
		String str3 = "가나@다라@마바@";
		String[] sp = str3.split("@");
		
		for (int i = 0; i < sp.length; i++) {
			System.out.println(sp[i]);
		}
		
		System.out.println(Arrays.toString(sp));
		
		// 문자열을 치환할 때(찾아 바꿀 때) 사용하는 메소드 : replaceAll()
		System.out.println(str2.replaceAll("PP", "@@"));
		System.out.println(str2.replaceAll("P", "@@"));
		
		// 좌우 공백을 제거할 때 사용하는 메소드 : trim()
		String str4 = "   abc   def   ";
		System.out.println(str4);
		System.out.println("공백 제거 전 길이 : " + str4.length());
		System.out.println(str4.trim());		//양끝 좌우 공백만 제거
		System.out.println("공백 제거 후 길이 : " + str4.trim().length());
		
		
	}//main()
}//class
