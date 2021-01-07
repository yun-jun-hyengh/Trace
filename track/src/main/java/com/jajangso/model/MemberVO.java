package com.jajangso.model;

public class MemberVO {
	private String memberid; // 아이디
	private String memberpw; // 비밀번호
	private String membername; // 회원이름
	private String membergender; // 회원성별
	private int member_birth_y; // 회원 년도
	private int member_birth_m; // 회원 월
	private int member_birth_d; // 회원 일
	private int phone1; // 회원 전화번호 앞자리
	private int phone2; // 회원 전화번호 중간자리
	private int phone3; // 회원 전화번호 뒷자리
	private String sms; // sms 수신동의 
	private String email; // 이메일
	private String zipcode; // 우편번호
	private String roadAddress; // 지번
	private String jibunAddress; // 도로명
	private String namujiAddress; // 나머지주소
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMemberpw() {
		return memberpw;
	}
	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getMembergender() {
		return membergender;
	}
	public void setMembergender(String membergender) {
		this.membergender = membergender;
	}
	public int getMember_birth_y() {
		return member_birth_y;
	}
	public void setMember_birth_y(int member_birth_y) {
		this.member_birth_y = member_birth_y;
	}
	public int getMember_birth_m() {
		return member_birth_m;
	}
	public void setMember_birth_m(int member_birth_m) {
		this.member_birth_m = member_birth_m;
	}
	public int getMember_birth_d() {
		return member_birth_d;
	}
	public void setMember_birth_d(int member_birth_d) {
		this.member_birth_d = member_birth_d;
	}
	public int getPhone1() {
		return phone1;
	}
	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}
	public int getPhone2() {
		return phone2;
	}
	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}
	public int getPhone3() {
		return phone3;
	}
	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getNamujiAddress() {
		return namujiAddress;
	}
	public void setNamujiAddress(String namujiAddress) {
		this.namujiAddress = namujiAddress;
	}
	
	
	
	

}
