package com.oneteam.guardSanctuary.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oneteam.guardSanctuary.persistence.ClientDAO;
import com.oneteam.guardSanctuary.vo.ClientVO;
import com.oneteam.guardSanctuary.vo.EmpVO;

	
@Service
public class ClientServiceImpl implements EmpService {
	
	@Autowired
	ClientDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 광회, 직원등록
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		
		ClientVO vo = new ClientVO();
		
		String encPwd = passwordEncoder.encode(req.getParameter("pwd"));
		System.out.println("암호화된 패스워드 : " + encPwd);

		vo.setId(req.getParameter("id"));		// 아이디
		vo.setPwd(encPwd);						// 암호화된 패스워드
		vo.setName(req.getParameter("name"));	// 이름
		
		// 연락처
		String phone = "";
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		phone = hp1 + "-" + hp2 + "-" + hp3;
		vo.setPhone(phone);

		// 이메일
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		email = email1 + "@" + email2;
		vo.setEmail(email);
		
		vo.setAddress(req.getParameter("address"));	// 주소
		
		// Email 인증
		// 인증 키 부분
		StringBuffer temp = new StringBuffer();	// 문자열
		Random rnd = new Random();
		for(int i = 0 ; i < 6 ; i++) {
			int rIndex = rnd.nextInt(2);	// 2를 제외한 0부터 1까지 난수 생성
			switch(rIndex) {
			case 0:
				// 난수로 아스키코드 생성 후 문자열(temp)로 붙이기 -> StringBuffer.append("값");
				temp.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 1:
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		String key = temp.toString();	// 난수로 생성된 문자열을 key 변수에 대입
		vo.setM_key(key);
		
		// 직원등록 처리
		int insertCnt = dao.insertClient(vo);
		
		if(insertCnt != 0) {
			dao.sendMail(email, key);
		}
		
		System.out.println("insertCnt ==> " + insertCnt);
		model.addAttribute("insertCnt", insertCnt);
		
		// 회원가입절차 - 암호화 성공 21-02-25 00:11
	}
	
	// 이메일 인증 확인
	@Override
	public void emailChk(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		
		int selectCnt = dao.selectKey(key);
		System.out.println("이메일 인증 키 확인(1:성공 / 0:실패) ==> " + selectCnt);
		if(selectCnt == 1) {
			int insertCnt = dao.updateGrade(key);
			model.addAttribute("insertCnt", insertCnt);
		}
	}
	
	// 광회, 회원 아이디 중복 확인
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		
		String strId = req.getParameter("id");
		int cnt = dao.idCheck(strId);
		
		System.out.println("중복 아이디 수 : " + cnt);
		
		model.addAttribute("selectCnt", cnt);
		model.addAttribute("id", strId);
		
	}
	
	// 로그인 처리 - 시큐리티에서 사용 안 함
	@Override
	public void loginAction(HttpServletRequest req, Model model) {
		
		String strId = req.getParameter("input_id");
		String strPwd = req.getParameter("input_pwd");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int selectCnt = dao.idPwdChk(map);
		
		if(selectCnt == 1) {
			req.getSession().setAttribute("clientId", strId);
		}
		req.setAttribute("selectCnt", selectCnt);
	}
	
	// 회원정보 인증 및 삭제(탈퇴) 처리
	@Override
	public void deleteClientAction(HttpServletRequest req, Model model) {
		
		int selectCnt = 0;
		int deleteCnt = 0;
		
		String strId = (String)req.getSession().getAttribute("clientId");
		String strPwd = req.getParameter("pwd");
		
		// 시큐리티 적용 -> dao에서 pwdCheck 가져오기
		String pwd = dao.pwdCheck(strId);
		System.out.println("DB 비밀번호 : " + strPwd);
		System.out.println("입력 비밀번호 : " + pwd);
				
		// passwordEncoder.matches(입력비밀번호, DB비밀번호) 적용
		System.out.println("비밀번호 대조 결과 : " + passwordEncoder.matches(strPwd, pwd));
				
		// 비밀번호가 일치하는 경우
		if(passwordEncoder.matches(strPwd, pwd)) {
			selectCnt = 1;
		}
		// 비밀번호가 불일치하는 경우
		else {
			selectCnt = -1;
		}
		
		if(selectCnt == 1) {
			deleteCnt = dao.deleteClient(strId);
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	
	// 직원정보 인증 및 상세 페이지
	@Override
	public void modifyViewAction(HttpServletRequest req, Model model) {
		
		int selectCnt = 0;
		ClientVO vo = null;

		String strId = (String)req.getSession().getAttribute("emp_id");
		String strPwd = req.getParameter("pwd");	// 입력 비밀번호
		
		// 시큐리티 적용 -> dao에서 pwdCheck 가져오기
		String pwd = dao.pwdCheck(strId);
		System.out.println("입력 비밀번호 : " + strPwd);
		System.out.println("DB 비밀번호 : " + pwd);
		
		// passwordEncoder.matches(입력비밀번호, DB비밀번호) 적용
		System.out.println("비밀번호 대조 결과 : " + passwordEncoder.matches(strPwd, pwd));
		
		// 비밀번호가 일치하는 경우
		if(passwordEncoder.matches(strPwd, pwd)) {
			selectCnt = 1;
		}
		
		if(selectCnt == 1) {
			vo = dao.getClientInfo(strId);
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("vo", vo);
		
	}
	
	// 회원정보 수정처리
	@Override
	public void modifyClientAction(HttpServletRequest req, Model model) {

		ClientVO vo = new ClientVO();
		
		vo.setId((String)req.getSession().getAttribute("clientId"));
		String encryptPassword = passwordEncoder.encode(req.getParameter("mod_pwd"));
		System.out.println("암호화된 패스워드 : " + encryptPassword);
		
		vo.setPwd(encryptPassword);
		vo.setName(req.getParameter("mod_name"));
		
		String phone = "";
		String hp1 = req.getParameter("mod_hp1");
		String hp2 = req.getParameter("mod_hp2");
		String hp3 = req.getParameter("mod_hp3");
		phone = hp1 + "-" + hp2 + "-" + hp3;
		vo.setPhone(phone);
		
		String email = "";
		String email1 = req.getParameter("mod_email1");
		String email2 = req.getParameter("mod_email2");
		email = email1 + "@" + email2;
		vo.setEmail(email);
		
		vo.setAddress(req.getParameter("mod_address"));
		
		int updateCnt = dao.updateClient(vo);
		
		System.out.println("=== 수정된 정보 ===");
		System.out.println("요청자 : " + vo.getId());
		System.out.println("변경비밀번호 : " + vo.getPwd());
		System.out.println("변경이름 : " + vo.getName());
		System.out.println("변경연락처 : " + vo.getPhone());
		System.out.println("변경이메일 : " + vo.getEmail());
		System.out.println("변경주소 : " + vo.getAddress());
		
		model.addAttribute("updateCnt", updateCnt);
		req.getSession().setAttribute("clientId", vo.getId());	// 수정 후 알 수 없는 이유로 세션이 삭제돼 이 코드 삽입

	}
	
	// 회원정보 조회(관리자용)
	@Override
	public void listViewAction(HttpServletRequest req, Model model) {
		
		String hostId = (String)req.getSession().getAttribute("clientId");
		
		// 페이징
		int pageSize = 10;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 화면에 뜬 시작페이지
		int endPage = 0;		// 화면에 뜬 마지막 페이지
		
		System.out.println("hostId : " + hostId);
		
		cnt = dao.getClientCnt(hostId);	// 회원 수 세기
		System.out.println("회원 수 : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		System.out.println("페이지 번호 : " + pageNum);
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정
		}
		
		// (pageNum != null)인 경우
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("현재 페이지 : " +  currentPage);
		
		// 페이지 갯수
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지 있으면 1페이지 추가
		System.out.println("페이지 갯수 : " +  pageCount);
		
		// 현재페이지 시작 글번호(페이지별) => 최신글을 먼저 봐야 하므로 내림차순 정렬이 돼야 한다. 또, 페이지별로 글 번호가 1~5 범위로 반복돼야 한다.
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지 마지막 글 번호(페이지별) => 가장 끝 페이지의 마지막 글 번호는 start 변수만으론 처리할 수 없다.
		end = start + pageSize - 1;
		
		System.out.println("현재 페이지 시작 글번호 : " + start);
		System.out.println("현재 페이지 마지막 글번호 : " + end);
		
		// 출력용 글 번호 / 최종 페이지 => 30번 / 1페이지
		number = cnt - (currentPage - 1) * pageSize;
		System.out.println("출력용 글 번호 : " + number);
		System.out.println("한 페이지 당 출력할 글 갯수 : " + pageSize);
		
		// 시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("화면에 뜬 시작 페이지 : " + startPage);
					
		// 마지막 페이지
		endPage = startPage + pageBlock -1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("화면에 뜬 마지막 페이지 : " + endPage);
		
		System.out.println("====================");
		
		if(cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("hostId", hostId);
			List<ClientVO> dtos = dao.viewClientList(map);
			model.addAttribute("dtos", dtos);
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);	
		model.addAttribute("pageNum", pageNum);
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
		
	}
	
	// 특정회원정보 조회(관리자용)
	@Override
	public void clientSearch(HttpServletRequest req, Model model) {
		
		String hostId = (String)req.getSession().getAttribute("clientId");
		
		// 입력값 가져오기 
		String clientName = req.getParameter("clientName");
		String searchClientName = "%" + clientName + "%";
		
		System.out.println("hostId : " + hostId);
		System.out.println("searchClientName : " + searchClientName);
		
		// 페이징
		int pageSize = 10;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int searchCnt = 0;		// 검색된 갯수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 화면에 뜬 시작페이지
		int endPage = 0;		// 화면에 뜬 마지막 페이지
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("searchClientName", searchClientName);
		map1.put("hostId", hostId);
		
		searchCnt = dao.getSearchClientCnt(map1);	// 검색된 회원 수 세기
		System.out.println("검색된 회원 수 : " + searchCnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정
		}
		System.out.println("페이지 번호 : " + pageNum);
		
		// (pageNum != null)인 경우
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("현재 페이지 : " +  currentPage);
		
		// 페이지 갯수
		pageCount = (searchCnt / pageSize) + (searchCnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지 있으면 1페이지 추가
		System.out.println("페이지 갯수 : " +  pageCount);
		
		// 현재페이지 시작 글번호(페이지별) => 최신글을 먼저 봐야 하므로 내림차순 정렬이 돼야 한다. 또, 페이지별로 글 번호가 1~5 범위로 반복돼야 한다.
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지 마지막 글 번호(페이지별) => 가장 끝 페이지의 마지막 글 번호는 start 변수만으론 처리할 수 없다.
		end = start + pageSize - 1;
		
		System.out.println("현재 페이지 시작 글번호 : " + start);
		System.out.println("현재 페이지 마지막 글번호 : " + end);
		
		// 출력용 글 번호 / 최종 페이지 => 30번 / 1페이지
		number = searchCnt - (currentPage - 1) * pageSize;
		System.out.println("출력용 글 번호 : " + number);
		System.out.println("한 페이지 당 출력할 글 갯수 : " + pageSize);
		
		// 시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("화면에 뜬 시작 페이지 : " + startPage);
					
		// 마지막 페이지
		endPage = startPage + pageBlock -1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("화면에 뜬 마지막 페이지 : " + endPage);
		
		System.out.println("====================");
		
		if(searchCnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("hostId", hostId);
			map.put("searchClientName", searchClientName);
			List<ClientVO> dtos = dao.searchClientList(map);
			model.addAttribute("dtos", dtos);
		}
		
		model.addAttribute("searchCnt", searchCnt);
		model.addAttribute("number", number);	
		model.addAttribute("pageNum", pageNum);
		
		if(searchCnt > 0) {
			model.addAttribute("clientName", clientName);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
		
	}

}
