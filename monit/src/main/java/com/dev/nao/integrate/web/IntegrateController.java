package com.dev.nao.integrate.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntegrateController {

	@RequestMapping(value = "/integrate", method = RequestMethod.GET)
	public String dashboard(HttpServletRequest request, Model model) throws Exception {
		
		return "integrate/integrate";
	}
}
