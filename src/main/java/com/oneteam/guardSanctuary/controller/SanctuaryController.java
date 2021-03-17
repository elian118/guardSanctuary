package com.oneteam.guardSanctuary.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oneteam.guardSanctuary.service.ClientServiceImpl;
import com.oneteam.guardSanctuary.service.EmpServiceImpl;

@Controller
public class SanctuaryController {
	
	// 깃 테스트 ~
	private static final Logger logger = LoggerFactory.getLogger(SanctuaryController.class);
	
	@Autowired
	EmpServiceImpl empService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	// 광회, 분리된 관리자 로그인 첫 화면 - 시큐리트 적용
	// 관리자는 직원 등록, 급여관리, 결산차트 확인이 가능하다.
	@RequestMapping("/success.ad")
	public String loginAdmin(HttpServletRequest req, Model model) {
		logger.info("url ==> main");
		
		return "/common/success";
	}
	
	// 광회, 분리된 일반직원 로그인 첫 화면 - 시큐리트 적용
	// 일반직원은 관리자 업무를 제외한 메뉴만 볼 수 있다.
	@RequestMapping("/success.emp")
	public String loginUser(HttpServletRequest req, Model model) {
		logger.info("url ==> main");
		
		return "/common/success";
	}
	
	// 광회, 첫 화면
	// 분리된 비회원 로그인(실패) 함께 사용 - 시큐리트 적용
	@RequestMapping("/main.do")
	public String loginFailed(HttpServletRequest req, Model model) {
		logger.info("url ==> main");
		
		return "/common/main";
	}
	
	// 광회, 직원등록신청
	// 당분간 테스트를 위해 .do 상태로 둔다. 원래 .ad가 맞다.
	@RequestMapping("/signInAction.do")
	public String signInAction(HttpServletRequest req, Model model) {
		logger.info("url ==> signInAction");
		
		empService.signInAction(req, model);	// 메서드 호출
		
		return "/emp/signInAction";
	}
	
	// 광회, 직원 아이디 중복확인
	// 당분간 테스트를 위해 .do 상태로 둔다. 원래 .ad가 맞다.
	@RequestMapping("/confirmId.do")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("url ==> confirmId");
		
		empService.confirmId(req, model);	// 메서드 호출
		
		return "/emp/confirmId";
	}
	
	// 광회, 직원등록 성공
	// 당분간 테스트를 위해 .do 상태로 둔다. 원래 .ad가 맞다.
	@RequestMapping("/mainSuccess.do")
	public String mainSuccess(HttpServletRequest req, Model model) {
		logger.info("url ==> mainSuccess");
		
		int cnt = Integer.parseInt(req.getParameter("insertCnt"));
		model.addAttribute("insertCnt", cnt);	// 성공 시 1이 전송
		
		return "/common/main";
	}
	
	// 광회, 직원 이메일 인증 확인
	@RequestMapping("/emailChk.do")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("url ==> /emailChk");
		
		empService.emailChk(req, model);
		
		return "/common/emailChk";
	}
	
	// 광회, 고객 첫화면 
	@RequestMapping("/cl_main.do")
	public String loginIndex(HttpServletRequest req, Model model) {
		logger.info("url ==> cl_main.do");
		
		return "/client/cl_main";
	}

	// 광회, 고객 로그인 홈 
	@RequestMapping("/cl_home.cl")
	public String loginHome(HttpServletRequest req, Model model) {
		logger.info("url ==> cl_home.cl");
		
		return "/client/cl_home";
	}

	// 광회, 회원 아이디 중복 확인
	@RequestMapping("/confirmClientId.do")
	public String confirmClientId(HttpServletRequest req, Model model) {
		logger.info("url ==> confirmClientId");
		
		clientService.confirmId(req, model);	// 메서드 호출
		
		return "/emp/confirmId";
	}
	
	// 광회, 회원가입 처리
	
	// 로그인 -회원탈퇴
	
	// 로그인 - 회원정보 수정 인증
	
	// 로그인 - 회원정보 수정 처리
	
	// 로그인 - 회원정보 수정 후 복귀(id/pw 조회절차 생략) - 테스트용(실제로 사용되진 않는다.)
	
}