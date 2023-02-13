package com.dev.nao.login.service;

/**
 * 로그인 및 회원가입을 위한 Service interface <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public interface LoginService {
	public LoginVO login(LoginVO loginVO) throws Exception;
}