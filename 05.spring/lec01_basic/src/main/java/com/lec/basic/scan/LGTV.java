package com.lec.basic.scan;

import org.springframework.stereotype.Component;

@Component("tv")
public class LGTV implements TV{

	public LGTV() { System.out.println("==> @Component - LGTV 객체생성!!");	}
	
	
	public void powerOn() {}
	public void powerOff() {}
	public void volumnUp() {}
	public void volumnDown() {}

}
