package com.oneteam.guardSanctuary.vo;
import java.sql.Date;
// 공책방 ClientVO

public class EmpVO {
	private String id;			// 아이디
	private String pwd;			// 비밀번호
	private String name;		// 이름
	private String bank;		// 은행명 - 기본값 '정보없음'
	private String account;		// 계좌번호 - 기본값 '정보없음'
	private String licence;		// 자격증 - 기본값 '정보없음'
	private String position;	// 직급
	private String dept;		// 부서
	private int salCode;		// 호봉코드
	private String email;		// 이메일
	private String phone;		// 연락처
	private String address;		// 주소
	private String hireDate;	// 입사일, 등록일
	private String enabled;		// 권한
    private String authority;	// 등급
	private String m_key;		// 이메일 인증키(1회용) - 백앤드에서 생성된다.
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getLicence() {
		return licence;
	}
	public void setLicence(String licence) {
		this.licence = licence;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getSalCode() {
		return salCode;
	}
	public void setSalCode(int salCode) {
		this.salCode = salCode;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getM_key() {
		return m_key;
	}
	public void setM_key(String m_key) {
		this.m_key = m_key;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
}
