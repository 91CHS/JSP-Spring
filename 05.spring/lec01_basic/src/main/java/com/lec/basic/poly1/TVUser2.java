package com.lec.basic.poly1;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class TVUser2 {
	public static void main(String[] args) {
		
		// 1. Spring 컨테이너구동
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		
		// 2. 필요한 객체를 Spring컨테이너에게 요청
//		TV tv = (TV) factory.getBean("lg");
		
		
//		tv.powerOn();
//		tv.powerOff();
//		tv.volumnUp();
//		tv.volumnDown();
		
		// 3. Spring 컨테이너를 종료
		factory.close();
		
		
		
	}
}
