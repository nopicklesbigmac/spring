package com.care.di.quiz4;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		String location = "classpath:quiz4.xml";
		GenericXmlApplicationContext gxac = new GenericXmlApplicationContext(location);
		
		IStudent student = gxac.getBean(IStudent.class);
		student.excute();
	}

}
