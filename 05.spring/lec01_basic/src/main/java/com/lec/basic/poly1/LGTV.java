package com.lec.basic.poly1;

public class LGTV implements TV {
	
	  //초기화
	public void initMethod() {System.out.println("==> 초기화메서드호출(초기화작업)");}
	  public LGTV() {System.out.println("==> LGTV() 생성자호출!!");}
	  public void powerOn() { System.out.println("LG TV - powerOn!!");}
	  public void powerOff() { System.out.println("LG TV - powerOff!!");}
	  public void volumnUp() { System.out.println("LG TV - volumnUp!!");}
	  public void volumnDown() { System.out.println("LG TV - volumnDown!!");}
}
