package com.dev.nao.login.service;

/**
 * 로그인 및 회원가입 데이터 모델 <br>
 * 22.04.18 <br>
 * @author 이용석
 */
public class LoginVO {

	/** 아이디(user_idx) */
	private String id;
	/** 비밀번호*/
	private String password;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


}
