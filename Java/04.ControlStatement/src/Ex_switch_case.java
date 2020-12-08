public class Ex_switch_case {
	public static void main(String[] args) {
		/*
		 ○ 선택문(switch ~~ case ~~) : 다중 if문을 간략하게 표현
		 
		 switch (기준값) {
		 	case 값1 :
		 		값1이 참일 때 실행되는 문장;
		 		break;
		 	case 값2 :
		 		값2이 참일 때 실행되는 문장;
		 		break;
		 	case 값N :
		 		값N이 참일 때 실행되는 문장;
		 		break;
		 	default :
		 		거짓일 때 실행되는 문장;
		 		break;
		 }
		 
		 ※ 기준값, 비교값(값1, 값2, 값N)은 정수형(수치형)의 자료형이어야 한다.
		※ 실행문 뒤에는 반드시 break; 를 입력해야 한다.
		※ 이러한 제한사항(제약조건)으로 인하여 실무에서는 거의 사용되지 않는다. 
		 
		*/
		
		int score = 87;
		
		switch (score / 10) {
		case 10:		// 100점
		// case >=90					// 컴파일 오류
			// System.out.println("A학점");
			// break;
		case 9:			// 90 ~ 99점
			System.out.println("A학점");
			break;
		case 8:			// 80 ~ 89점
			System.out.println("B학점");
			break;
		case 7:			// 70 ~ 79점
			System.out.println("C학점");
			break;
		case 6:			// 60 ~ 69점
			System.out.println("D학점");
			break;
		default:		// 60점 미만
			System.out.println("F학점");
			break;
		}
		
	} //main()
} //class
