
public class PersonMain {
	// 3명의 개인정보를 저장할 객체배열(person[])을 선언 및 생성하고 값을 할당
	// "홍길동", 27, 175.5cm, 75kg, "광주시 서구 농성동", "010-1111-1111"
	// "나길동", 33, 185cm, 65.5kg, "광주시 남구 봉선동", "010-2222-2222"
	// "지선우", 25, 165cm, 48.5kg, "서울시 강남구 청담동", "010-3333-3333"
	// 저장된 객체 배열에 내용을 출력 : display() 호출
	public static void main(String[] args) {
		PersonDTO[] person = new PersonDTO[3];
		
		person[0] = new PersonDTO("홍길동", 27, 175.5f, 75, "광주시 서구 농성동", "010-1111-1111");
		person[1] = new PersonDTO("나길동", 33, 185, 65.5f, "광주시 남구 봉선동", "010-2222-2222");
		person[2] = new PersonDTO("지선우", 25, 165, 48.5f, "서울시 강남구 청담동", "010-3333-3333");
		
		// 객체배열의 내용 출력 : display() 호출
		PersonDAO dao = new PersonDAO();
		dao.display(person);
		
		dao.ageAscSort(person);		// 나이의 오름차순 정렬
		dao.display(person);
		
		dao.heightDescSort(person);	// 키의 내림차순 정렬
		dao.display(person);
		
		dao.nameAscSort(person);	// 성명의 오름차순 정렬
		dao.display(person);
	}//main()
}//class
