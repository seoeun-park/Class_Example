import java.util.ArrayList;

import com.hanul.member.MemberDTO;

public class ForEachMain02 {
	public static void main(String[] args) {
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("홍길동", 27, "광주광역시 서구 농성동", "010-1111-1111"));
		list.add(new MemberDTO("김길동", 29, "광주광역시 서구 쌍촌동", "010-2222-2222"));		
		
		display(list);
		System.out.println("=============================================");
		
		//swap : 서로 자리 바꿈(교환) → 임시변수(temp), set()
		MemberDTO temp1 = list.get(0);
		list.set(0, list.get(1));
		list.set(1, temp1);
		
		//ArrayList<> 값을 출력
		display(list);
		System.out.println("=============================================");
		
		//나이의 오름차순으로 정렬 후 출력
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if(list.get(i).getAge() > list.get(j).getAge()) {
					MemberDTO temp2 = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp2);
				}//if
			}//for j
		}//for i
		
		display(list);
		
	}//main()
	
	//ArrayList<> 값을 출력하는 메소드
	public static void display(ArrayList<MemberDTO> list) {
		for (MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}//for		
	}//display()
	
}//class
