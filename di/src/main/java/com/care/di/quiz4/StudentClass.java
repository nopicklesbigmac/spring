package com.care.di.quiz4;

import java.util.ArrayList;

public class StudentClass implements IStudent{
	private String name;
	private ArrayList<String> foods;
	private PrintClass pc;
	
	@Override
	public void excute() {
		pc.show(name, foods);
	}
	
	public StudentClass() {}
	public StudentClass(String name) {
		super();
		this.name = name;
	}

	public void setFoods(ArrayList<String> foods) {
		this.foods = foods;
	}
	public void setPc(PrintClass pc) {
		this.pc = pc;
	}
}
