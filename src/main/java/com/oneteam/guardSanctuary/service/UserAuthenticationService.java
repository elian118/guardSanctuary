package com.oneteam.guardSanctuary.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.oneteam.guardSanctuary.vo.EmpVO;
import com.oneteam.guardSanctuary.vo.UserVO;

// UserDetailService : 스프링 프레임웍에 내장된 인터페이스
// UserDetailService : users 테이블의 정보를 가지고 인증처리를 위해 사용자 상세정보를 제공하는 인터페이스 
@Service
public class UserAuthenticationService implements UserDetailsService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder PasswordEncoder;
	
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// DB 조회
	@Override
	public UserDetails loadUserByUsername(String strId) throws UsernameNotFoundException {
		System.out.println("아이디 : " + strId);
		// id와 패스워드가 불일치시 null이 넘어오고, 일치시 계정이 넘어온다.
		// 비밀번호 체크로직은 스프링 시큐리티안에 숨어있다.
		
		// 권한 등급 확인
		// VO는 ClientVO 없이 EmpVO만 사용한다. 어차피 확인할 변수는 이름이 같기 때문이다.
		EmpVO vo = null;
		
		vo = sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.EmpDAO.getEmpInfo", strId);
		
		System.out.println("관리자 아이디 존재여부 확인 : " + vo);
		
		if(vo == null) {
			vo = sqlSession.selectOne("com.oneteam.guardSanctuary.persistence.ClientDAO.getClientInfo", strId);
		}
		
		System.out.println("고객 아이디 존재여부 확인 : " + vo);
		System.out.println("로그인 체크 == > " + vo);
		
		// 인증 실패시 인위적으로 예외 발생
		if(vo == null) throw new UsernameNotFoundException(strId);
		
		// List나 ArrayList 먼저 import하고 GrantedAuthority import
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		authority.add(new SimpleGrantedAuthority(vo.getAuthority()));
		
		// 값 확인
		System.out.println("DB 아이디 : " + vo.getId());
		System.out.println("DB 비밀번호 : " + vo.getPwd());
		System.out.println("DB 이메일인증 : " + vo.getEnabled());
		System.out.println("DB 권한 : " + vo.getAuthority());
		
		/*
		 * 비밀번호가 불일치시 LoginFailure, 일치시 LoginSuccess
		 * 테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부로직으로 비교처리
		 */
		// 스프링 시큐리티 User 클래스를 상속받는 UserVO 매개변수 생성자를 호출해 반환
		return new UserVO(vo.getId(), vo.getPwd(), vo.getEnabled().equals("1"),
				true, true, true, authority);
	}

}
