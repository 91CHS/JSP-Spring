package com.lec.basic.poly1;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class TVUser3 {
	public static void main(String[] args) {
		
		
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		
		TV tv1 = (TV) factory.getBean("ss");
		TV tv2 = (TV) factory.getBean("ss");
		TV tv3 = (TV) factory.getBean("ss");
		

		factory.close();
		
		
		
	}
}
