package com.dev.nao.login.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.dev.nao.login.service.LoginService;
import com.dev.nao.login.service.LoginVO;

/**
 * 濡쒓렇�씤 諛� �쉶�썝媛��엯�쓣 �쐞�븳 Service 援ы쁽泥� <br>
 * 22.04.18 <br>
 * @author �씠�슜�꽍
 */
@Service("loginService")
@PropertySource(value = "classpath:/properties/crypt.properties")
public class LoginServiceImpl implements LoginService {

	@Resource(name="loginDAO")
    private LoginDAO loginDAO;

	@Value("${crypt.fullKey}")
	private String cryptKey;

	@Override
	public LoginVO login(LoginVO loginVO) throws Exception {
		return loginDAO.login(loginVO);
	}
}
