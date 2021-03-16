package com.oneteam.guardSanctuary.persistence;
import java.util.List;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.oneteam.guardSanctuary.vo.ClientVO;
import com.oneteam.guardSanctuary.vo.EmpVO;


@Repository
public class EmpDAOImpl implements EmpDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 광회, 회원가입 처리
	@Override
	public int insertEmp(EmpVO vo) {
		return sqlSession.insert("com.oneteam.guardSanctuary.persistence.EmpDAO.insertEmp", vo);
	}
	
	// 이메일 인증
	@Override
	public void sendMail(String toEmail, String key) {
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "회원가입 인증 메일입니다. 링크를 눌러 회원가입을 완료하세요." 

			+ "<a href='http://localhost/guardSanctuary/emailChk.do?key=" + key + "'>Please click</a>";
            System.out.println(txt);
            message.setSubject("회원가입 인증 메일입니다.");
            message.setText(txt, "UTF-8", "html");
            message.setFrom(new InternetAddress("postelian@gmail.com"));
            message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
            mailSender.send(message);
		}
		catch(Exception e) {
			e.printStackTrace();
		}  
		
	}
	
	// 이메일 인증 확인
	@Override
	public int selectKey(String key) {
		return sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.EmpDAO.selectKey", key);
	}
	
	// 이메일 인증 완료 - 사용 가능(Enable : 1)
	@Override
	public int updateGrade(String key) {
		return sqlSession.update("com.oneteam.guardSanctuary.persistence.EmpDAO.updateGrade", key);
	}
	
	// 광회, 중복확인 처리
	@Override
	public int idCheck(String strId) {
		System.out.println("strId : " + strId);
		return sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.EmpDAO.idCheck", strId);
	}
	
	// 로그인 처리
	@Override
	public int idPwdChk(Map<String, String> map) {
		return sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.ClientDAO.idPwdChk", map);
	}
	
	// 직원정보 인증
	@Override
	public String pwdCheck(String strId) {
		return sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.ClientDAO.pwdCheck", strId);
	}

	
	// 직원정보 삭제 처리
	@Override
	public int deleteClient(String strId) {
		return sqlSession.delete("com.oneteam.guardSanctuary.persistence.EmpDAO.deleteClient", strId);
	}
	
	// 회원정보 상세 페이지
	@Override
	public EmpVO getEmpInfo(String strId) {
		return sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.EmpDAO.getClientInfo", strId);
	}
	
	// 회원정보 수정 처리
	@Override
	public int updateClient(ClientVO vo) {
		return sqlSession.update("com.oneteam.guardSanctuary.persistence.ClientDAO.updateClient", vo);
	}
	
	// 회원 수 세기(관리자용)
	@Override
	public int getClientCnt(String hostId) {
		return sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.ClientDAO.getClientCnt", hostId);
	}
	
	// 회원정보 조회(관리자용)
	@Override
	public List<ClientVO> viewClientList(Map<String, Object> map) {
		return sqlSession.selectList("com.oneteam.guardSanctuary.persistence.ClientDAO.viewClientList", map);
	}
	
	// 검색된 회원 수 세기(관리자용)
	@Override
	public int getSearchClientCnt(Map<String, Object> map1) {
		return sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.ClientDAO.getSearchClientCnt", map1);
	}
	
	// 특정 회원 검색(관리자용)
	@Override
	public List<ClientVO> searchClientList(Map<String, Object> map) {
		return sqlSession.selectList("com.oneteam.guardSanctuary.persistence.ClientDAO.searchClientList", map);
	}

}
