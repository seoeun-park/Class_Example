import com.hanul.student.StudentDAO;
import com.hanul.student.StudentDTO;

public class StudentMain {
	// 3명의 성적정보를 저장할 객체배열(student[])을 선언 및 생성하고 초기화
	// 총점, 평균계산(getSumAvg()), 평균 내림차순 정렬(avgDescSort()), 출력(display())
	// 성명 오름차순 정렬(nameAscSort()), 출력(display())
	public static void main(String[] args) {
		StudentDTO[] student = new StudentDTO[3];
		
		student[0] = new StudentDTO("홍길동", "2020001", "컴공과", 95.4f, 90.3f);
		student[1] = new StudentDTO("김길동", "2020002", "정통과", 80.7f, 85.6f);
		student[2] = new StudentDTO("나길동", "2020003", "전산과", 85f, 97.8f);
		
		StudentDAO dao = new StudentDAO(student);
		dao.getSumAvg();
		dao.avgDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	}//main()
}//class
