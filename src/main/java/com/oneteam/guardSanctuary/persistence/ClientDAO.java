package com.oneteam.guardSanctuary.persistence;

import java.util.List;
import java.util.Map;

import com.oneteam.guardSanctuary.vo.ClientVO;
import com.oneteam.guardSanctuary.vo.EmpVO;

// 고객 DAO
public interface ClientDAO {
	
	// 광회, 회원가입 처리
	public int insertClient(ClientVO vo);
	
	// 광회, 회원 이메일 인증
	public void sendMail(String toEmail, String key);
	
	// 광회, 회원 이메일 인증 확인
	public int selectKey(String key);
	
	// 광회, 회원 이메일 인증 완료 - 사용 가능(Enable : 1)
	public int updateGrade(String key);
	
	// 광회, 회원 아이디 중복확인
	public int idCheck(String strId);
	
	// 광회, 회원 로그인 처리
	public int idPwdChk(Map<String, String> map);
	
	// 광회, 회원정보 인증
	public String pwdCheck(String strId);
	
	// 광회, 회원정보 삭제 처리
	public int deleteClient(String strId);
	
	// 광회, 회원정보 상세 페이지
	public ClientVO getClientInfo(String strId);
	
	// 광회, 회원정보 수정 처리
	public int updateClient(ClientVO vo);
	
	// 광회, 회원 수 세기
	public int getClientCnt(String hostId);
	
	// 광회, 회원정보 조회
	public List<ClientVO> viewClientList(Map<String, Object> map);
		
	// 광회, 검색된 회원 수 세기
	public int getSearchClientCnt(Map<String, Object> map1);
	
	// 광회, 특정 직원 검색
	public List<ClientVO> searchClientList(Map<String, Object> map);
	
}
