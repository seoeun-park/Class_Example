package com.hanul.finalanimal;

public class Final_Action {
	public void action(Final_Animal animal) {	//다형성 인수
		animal.cry();
	
		if (animal instanceof Final_Dog) {		//객체타입비교
			
			((Final_Dog)animal).run();			//다운캐스팅
			
		} else if (animal instanceof Final_Cat) {
			
			((Final_Cat)animal).grooming();
			
		} else if(animal instanceof Final_Tiger) {
			
			((Final_Tiger)animal).hunter();
		}//if
	}//action()
	
	
}//class
