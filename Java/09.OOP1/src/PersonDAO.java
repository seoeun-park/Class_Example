import java.util.Arrays;

// display() ��� �޼ҵ�
public class PersonDAO {
	public void display(PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			System.out.print(person[i].getName() + "\t");
			System.out.print(person[i].getAge() + "\t");
			System.out.print(person[i].getHeight() + "\t");
			System.out.print(person[i].getWeight() + "\t");
			System.out.print(person[i].getAddr() + "\t");
			System.out.print(person[i].getTel() + "\n");
		}//for
		System.out.println("============================================"
				+ "=================");
		
	}//display()
	
	// ���� �������� ����
	public void ageAscSort(PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			for (int j = i + 1; j < person.length; j++) {
				if(person[i].getAge() > person[j].getAge()) {
					PersonDTO temp = person[i];
					person[i] = person[j];
					person[j] = temp;
				}//if
			}//for j
		}//for i
	}//ageAscSort()
	
	// Ű�� �������� ����
	public void heightDescSort(PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			for (int j = i + 1; j < person.length; j++) {
				if(person[i].getHeight() < person[j].getHeight()) {
					PersonDTO temp = person[i];
					person[i] = person[j];
					person[j] = temp;
				}//if
			}//for j
		}//for i
	}//heightDescSort()
	
	// ������ �������� ����  ��  String Type Sort : compareTo() �� ���ڿ��� ��
	public void nameAscSort(PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			for (int j = i + 1; j < person.length; j++) {
				if(person[i].getName().compareTo(person[j].getName()) > 0 ) {
					PersonDTO temp = person[i];
					person[i] = person[j];
					person[j] = temp;
				}//if
			}//for j
		}//for i
	}//nameAscSort()
}//class
