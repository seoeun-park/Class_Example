import java.util.ArrayList;

public class ArrayListMain04 {
	public static void main(String[] args) {
		//ArrayList<> list�� ���� 10, 20, 30, 40, 50�� ����(add())�ϰ� ���(get())
		ArrayList<Integer> list = new ArrayList<>();
		for(int i = 1; i <= 5; i++) {
			//list.add(new Integer(i * 10));
			list.add(i * 10);	//AutoBoxing
		}//for
		
		for (int i = 0; i < list.size(); i++) {
			//System.out.println((Integer)list.get(i));
			System.out.println(list.get(i));	//AutoUnBoxing
		}
		
	}//main()
}//class
