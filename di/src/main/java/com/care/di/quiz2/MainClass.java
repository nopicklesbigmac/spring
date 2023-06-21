package com.care.di.quiz2;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	public static void main(String[] args) {
		String location = "classpath:quiz2.xml";
		GenericXmlApplicationContext gxac = new GenericXmlApplicationContext(location);
		
		SaveClass sc = gxac.getBean(SaveClass.class);
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("입력 : ");
		String input = scanner.nextLine();
//		String[] inputs = input.split(" ");
//		
//		sc.setData1(Integer.parseInt(inputs[0]));
//		sc.setOper(inputs[1]);
//		sc.setData2(Integer.parseInt(inputs[2]));
		sc.setOper(input);
		sc.getReulst();
	}
}
