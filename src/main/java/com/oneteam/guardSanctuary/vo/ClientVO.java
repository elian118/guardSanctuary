package com.oneteam.guardSanctuary.vo;
import java.sql.Date;
// 공책방 ClientVO

public class ClientVO {
	private int cl_no;		// 고객번호
	private String id;			// 아이디
	private String pwd;			// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private String phone;		// 연락처
	private String category;	// 고객분류(개인/법인)
	private String reg_no;		// 주민/사업자등록번호
	private String business;	// 업태
	private String address;		// 주소
	private int floor;			// 층
	private String regDate;		// 가입일
	private String authority;	// 권한등급
	private String enabled;		// 이메일인증여부
    private String m_key;		// 이메일 인증키(1회용)
    private int emp_no;			// 담당기사 사번
	
    public int getCl_no() {
		return cl_no;
	}
	
    public void setCl_no(int cl_no) {
		this.cl_no = cl_no;
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
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getReg_no() {
		return reg_no;
	}
	
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	
	public String getBusiness() {
		return business;
	}
	
	public void setBusiness(String business) {
		this.business = business;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getFloor() {
		return floor;
	}
	
	public void setFloor(int floor) {
		this.floor = floor;
	}
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	
	public String getM_key() {
		return m_key;
	}
	
	public void setM_key(String m_key) {
		this.m_key = m_key;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
	
}
