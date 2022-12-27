package com.lec.basic.anno;

import org.springframework.stereotype.Component;

@Component("sony")
public class SonySpeaker implements Speaker {

	public SonySpeaker() {System.out.println("==> Sony Speaker 객체 생성"); }
	public void volumnUp() { System.out.println("==> Sonny Speaker 볼륨업"); }
	public void volumnDown() { System.out.println("==> Sonny Speaker 볼륨다운"); }
}
