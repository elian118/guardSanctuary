package com.oneteam.guardSanctuary.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ClientService {

	// 광회, 회원가입 처리
	public void signInAction(HttpServletRequest req, Model model);
	
	// 이메일 인증 확인
	public void emailChk(HttpServletRequest req, Model model);
	
	// 광회, 중복확인 처리
	public void confirmId(HttpServletRequest req, Model model);
	
	// 광회, 로그인 처리
	public void loginAction(HttpServletRequest req, Model model);
	
	// 회원정보 인증 및 삭제(탈퇴) 처리
	public void deleteClientAction(HttpServletRequest req, Model model);
	
	// 회원정보 인증 및 상세 페이지
	public void modifyViewAction(HttpServletRequest req, Model model);
	
	// 회원정보 수정처리
	public void modifyClientAction(HttpServletRequest req, Model model);
	
	// 회원정보 조회(관리자용)
	public void listViewAction(HttpServletRequest req, Model model);
	
	// 특정회원정보 조회(관리자용)
	public void clientSearch(HttpServletRequest req, Model model);
	
}
