package com.baizhi.ssm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baizhi.ssm.bean.User;
import com.baizhi.ssm.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;

//	登录检查
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public void login(User user,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		boolean b = userService.validateUser(user);
		if(b == true) {
			session.setAttribute("loginUser", user.getUsername());
			request.getRequestDispatcher("/WEB-INF/views/1.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}
	
//	退出登录（注销该用户）
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public void logout(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		session.invalidate();  //session失效
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

}
