package com.care.di.quiz3;

public class OperatorClass {

	public int operator(int data1, String oper, int data2) {
		
		int result = 0;
		if(oper.equals("+")) {
			result = data1 + data2;
		}else if(oper.equals("-")) {
			result = data1 - data2;
		}else if(oper.equals("*")) {
			result = data1 * data2;
		}else if(oper.equals("/")) {
			result = data1 / data2;
		}
		return result;
	}

}
