import java.util.ArrayList;
import java.util.Arrays;

import com.hanul.array.Test;

public class ArrayListMain01 {
	public static void main(String[] args) {
		// 3���� ����(ũ��)�� ���� ������ �迭(arr[])�� ���� �� �����Ͻÿ�.
		int[] arr = new int[3];
		
		// �迭(arr[])�� 10, 20, 30�� �Ҵ��Ͻÿ�.
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
		
		for (int i = 0; i < arr.length; i++) {
			arr[i] = (i + 1) * 10; 
		}
		
		// �迭(arr[])�� ������ ����Ͻÿ�
		for (int i = 0; i < arr.length; i++) {
			System.out.println("arr[" + i + "]�� �� : " + arr[i]);
		}
		
		System.out.println("arr[]�� �� : " + Arrays.toString(arr));
		//========================================================
		
		// Test.java(Ŭ����) Ÿ�� 5���� ������ �� �ִ� �迭�� ���� : com.hanul.array package
		Test[] test = new Test[5];		//�迭���� : ũ��(����)�� ����
		
		// Test.java(Ŭ����) Ÿ���� ũ��(����)�� ������ ���� ���� �迭�� ���� : ArrayList<>
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(new Test());		// add() : ����(�߰�)
		list.add(new Test());
		list.add(new Test());
		list.add(new Test());
		list.add(new Test());
		list.add(new Test());
		
		// ArrayList<>�� ����� Test Ŭ������ display() �޼ҵ带 ȣ��
		for (int i = 0; i < list.size(); i++) {		//size() : ArrayList<>�� ũ��(����)
			//list.display()		
			// ���� : display �޼ҵ�� Test Ŭ�����ȿ� �ִ� �޼ҵ��̹Ƿ� list�� Test�� Casting���Ѿ� �Ѵ�.
			((Test)(list.get(i))).display();	//get() : ���(���� ������ ��)
		}
		
		//System.out.println(Arrays.toString(list));
		// ArrayList�� Arrays Ŭ������ toString �޼ҵ�� ����� �� ����.
		
	}//main()
}//class

/*
�� Array[] : �迭
- ������(index)���� � �ڷḦ �����Ѵ�.
- �迭�� ũ��(����)�� ���� �����ؾ� �Ѵ�.
- �ڷ��� Ÿ���� �����ؾ� �Ѵ�.
- �迭 ���� �� ��üȭ(��ü ����)�Ǿ�� �Ѵ�. ��  new int[3];
- �߿��� �޼ҵ� : length �� ũ��(����)�� ����

�� ArrayList<> : ���� �迭
- ������(index)���� � �ڷḦ �����Ѵ�.
- �迭�� ũ��(����)�� �������� �ʴ´�.
- �ڷ��� Ÿ���� �޶� �ȴ�.(�ѹ��� �پ��� Ÿ���� �ڷḦ �����ϴ� ���� ���)
- ��, Ŭ���� Ÿ�Ը� ������ �����ϴ�.(��, <>��ȣ �ȿ� Ŭ���� Ÿ�Ը� ���;� �Ѵ�.)
- �迭 ���� �� ��üȭ(��ü����)�Ǿ�� �Ѵ�. ��  new ArrayList<>();
- �߿��� �޼ҵ� : size() �� ũ��, add() �� ����, get() �� ���, set() �� ����, remove() �� ����
 */
