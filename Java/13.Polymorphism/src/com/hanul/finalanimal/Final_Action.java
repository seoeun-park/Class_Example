package com.hanul.finalanimal;

public class Final_Action {
	public void action(Final_Animal animal) {	//������ �μ�
		animal.cry();
	
		if (animal instanceof Final_Dog) {		//��üŸ�Ժ�
			
			((Final_Dog)animal).run();			//�ٿ�ĳ����
			
		} else if (animal instanceof Final_Cat) {
			
			((Final_Cat)animal).grooming();
			
		} else if(animal instanceof Final_Tiger) {
			
			((Final_Tiger)animal).hunter();
		}//if
	}//action()
	
	
}//class
