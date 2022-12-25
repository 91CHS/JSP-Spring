package com.lec.member.vo;

import java.util.Objects;

public class MemberBean {

	
	private String member_id;	
	private String member_pw;		
	private String member_name;  	
	private int member_age;
	private String member_gender;
	private String member_email;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_age() {
		return member_age;
	}
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	@Override
	public int hashCode() {
		return Objects.hash(member_age, member_email, member_gender, member_id, member_name, member_pw);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberBean other = (MemberBean) obj;
		return member_age == other.member_age && Objects.equals(member_email, other.member_email)
				&& Objects.equals(member_gender, other.member_gender) && Objects.equals(member_id, other.member_id)
				&& Objects.equals(member_name, other.member_name) && Objects.equals(member_pw, other.member_pw);
	}
	@Override
	public String toString() {
		return "MemberBean [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_age=" + member_age + ", member_gender=" + member_gender + ", member_email=" + member_email
				+ "]";
	}

	
	
}
