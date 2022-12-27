package com.lec.basic.collection;

import java.util.List;
import java.util.Set;

import org.springframework.context.annotation.Bean;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanMain {

	public static void main(String[] args) {

		
		AbstractApplicationContext factory = new GenericXmlApplicationContext("collectionContext.xml");
		CollectionBean bean = (CollectionBean) factory.getBean("collectionBean");
		
		List<String> addressList = bean.getAddressList();
		
		for(String addr:addressList) {
			System.out.println(addr.toString());
		}
	
	
	    Set<String> addressSet = bean.getAddressSet();
	   for(String addr:addressSet) {
	    System.out.println(addr.toString());
	   }		
	    		
	    
	   factory.close();
	   
	   
	}
}
