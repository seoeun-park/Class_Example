import java.io.Serializable;

public class CalcDTO implements Serializable{		//��ü�� ����ȭ(��ȣȭ�Ǿ� ����)
	private int num1;
	private int num2;
	private String opCode;
	
	public CalcDTO() {}

	public CalcDTO(int num1, int num2, String opCode) {
		super();
		this.num1 = num1;
		this.num2 = num2;
		this.opCode = opCode;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public String getOpCode() {
		return opCode;
	}

	public void setOpCode(String opCode) {
		this.opCode = opCode;
	}
	
}
