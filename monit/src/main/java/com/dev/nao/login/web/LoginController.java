package com.dev.nao.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.nao.login.service.LoginService;
import com.dev.nao.login.service.LoginVO;
import com.dev.nao.util.StringEncrypter;

/**
 * 로그인 위한 Controller <br>
 * 22.03.18 <br>
 * @author 이용석 선임
 */
@Controller
@PropertySource(value = "classpath:/properties/crypt.properties")
public class LoginController {

	/** 로그인 처리 service */
	@Resource(name = "loginService")
	LoginService loginService;
	
	/** 암호화 처리 key */
	@Value("${crypt.fullKey}")
	private String cryptKey;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	/**
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String measure(HttpServletRequest request, Model model) throws Exception {
		if(request.getSession().getAttribute("id") == null) {
			return "login/login";
		}else {
			return "redirect:/dashboard";			
		}
	}
	
	/**
	 * 로그인 처리 <br>
	 * Parameter - email, password <br>
	 * Return String
	 * 로그인 성공여부
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			Model model) throws Exception 
	{
		String result = "1";
		
System.out.println(loginVO.getId());

//		LoginVO resultVO = loginService.login(loginVO);
//
//		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
//			logger.debug("Login Success : " + resultVO.getId());
//        	request.getSession().setAttribute("id", resultVO.getId());
//        	result =  "0";
//        } else {
//        	request.getSession().setAttribute("id", null);
//        	result = "1";
//        }
		
if("sjibs".equals(loginVO.getId()) && "admin1".equals(loginVO.getPassword())) {	
	request.getSession().setMaxInactiveInterval(60*60*6);
	request.getSession().setAttribute("id", loginVO.getId());
	result =  "0";
}else {
	request.getSession().setAttribute("id", null);
	result = "1";
}
		System.out.println(request.getSession().getAttribute("id"));
		
        model.addAttribute("message", result);
        
        return "ajax/messageContent";

	}

	/**
	 * 로그아웃 처리 <br>
	 * Parameter - null <br>
	 * Return String
	 * Main page redirect
	 */
    @RequestMapping(value="/logout", method = RequestMethod.GET)
	public String actionLogout(HttpServletRequest request, Model model) 
			throws Exception {

    	request.getSession().setAttribute("id", null);

    	return "redirect:/";
    }

}
