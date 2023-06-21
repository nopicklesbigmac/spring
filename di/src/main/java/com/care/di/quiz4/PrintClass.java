package com.care.di.quiz4;

import java.util.ArrayList;

public class PrintClass {

	public void show(String name, ArrayList<String> foods) {
		System.out.println("이름 : " + name);
		System.out.println("좋아하는 음식들");
		for(String food : foods)
			System.out.println(food);
	}

}
