package com.lec.basic.anno;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class TVUser {
		public static void main(String[] args) {
			
			AbstractApplicationContext factory = new GenericXmlApplicationContext("componentScan.xml");
			TV tv = (TV) factory.getBean("tv");
			
			tv.volumnUp();
			tv.volumnDown();
			
			
			factory.close();
			

		}
}
