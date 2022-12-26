package com.lec.basic.poly1;

import com.lec.basic.poly2.SonnySpeaker;

public class SamsungTV implements TV {
	  
	  
	  public SamsungTV() {System.out.println("==> SamsungTV() 생성자호출!!");}
	  public void powerOn() { System.out.println("Samsung TV - powerOn!!");	}
	  public void powerOff() { System.out.println("Samsung TV - powerOff!!");	}
	  public void volumnUp() { System.out.println("Samsung TV - volumnUp!!");	}
	  public void volumnDown() { System.out.println("Samsung TV - volumnDown!!");	}

}
