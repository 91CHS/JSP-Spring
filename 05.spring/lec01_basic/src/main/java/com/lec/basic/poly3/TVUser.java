package com.lec.basic.poly3;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.lec.basic.poly1.TV;

public class TVUser {
		public static void main(String[] args) {
			
			AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext3.xml");
			TV tv = (TV) factory.getBean("ss");
			
			tv.volumnUp();
			tv.volumnDown();
			
			factory.close();
		}
}
