package com.dev.nao.login.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.nao.login.service.LoginVO;

/**
 * 로그인 및 회원가입을 위한 DAO <br>
 * 22.04.18 <br>
 * @author 이용석
 */
@Repository("loginDAO")
public class LoginDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;

	public LoginVO login(LoginVO loginVO) throws Exception {
		return sqlSession.selectOne("loginDAO.login", loginVO);
	}
}
