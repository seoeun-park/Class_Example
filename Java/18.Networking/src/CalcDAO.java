public class CalcDAO {
	public int getResult(CalcDTO dto) {
		int num1 = dto.getNum1();
		int num2= dto.getNum2();
		String opCode = dto.getOpCode();
		
		int result = 0;
		if (opCode.equals("+")) {
			result = num1 + num2;
		} else if (opCode.equals("-")){
			result = num1 - num2;
		} else if (opCode.equals("*")){
			result = num1 * num2;
		} else if (opCode.equals("/")){
			result = num1 / num2;
		}
		
		return result;
	}//getResult()
}//class
